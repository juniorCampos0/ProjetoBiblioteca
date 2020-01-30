package com.library


import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import library.RestFieldsService
import library.UserLendingService
import org.springframework.core.ConstantException
import java.time.LocalDate

class BookController {

    def springSecurityService
    def sessionFactory

    static defaultAction = "index"

    @Secured('permitAll')
    def index(){
        def max
        params.max = Math.min(max ?: 10, 100)
        def user = springSecurityService.currentUser
        def books = Book.list(params)

        println "\n\n\n"
        for (param in params){
            println param
        }
        println "bookCount: "+Book.count()
        println "books: "+books.size()
        println "\n\n\n"

        [books: books, bookCount: Book.count(), authors: Author.list(), user: springSecurityService.currentUser, lendings: UserLendingService.getBooksInLending(user), page: 'index']
    }

    @Secured('permitAll')
    def search(){
        def max
        def user = springSecurityService.currentUser
        params.max = Math.min(max ?: 10, 100)

        def queryMajor = Book.booksWithThisParameter(params.expression)

        def result = getMactchedValue(params, params.expression)

        println(result.result)

        render view: 'index', model: [books: result.result, bookCount: result.count,
                                      authors: Author.list(), user: user,
                                      lendings: UserLendingService.getBooksInLending(user)]
    }

    @Secured('permitAll')
    def bookList() {
        def user =  springSecurityService.currentUser
        params.keySet().asList().each { if ('param1' != it) params.remove(it) }
        [books: Book.list(), authors: Author.list(), user: user, lendings: UserLendingService.getBooksInLending(user)]
    }

    @Secured('permitAll')
    def bookView() {
        def user = springSecurityService.currentUser
        def book = Book.get(params.idBookSearched as int)
        params.keySet().asList().each { if ('param1' != it) params.remove(it)}
        [book: book, books: Book.list(), logged : !(user == null) , user: user, avaliable: book.available]
    }

    @Secured('ROLE_ADMIN')
    def addBook(){
        def user = springSecurityService.currentUser
        params.keySet().asList().each { if ('param1' != it) params.remove(it) }
        [user:user, labels: Label.list(), authors: Author.list(), message:""]
    }

    @Secured('ROLE_ADMIN')
    def createBook(){

        def user = springSecurityService.currentUser
        def message = ""

        try {
            def book = new Book(title: params.title, subtitle: params.subtitle,
                    isbn: params.isbn, edition: Integer.parseInt(params.edition),
                    publisher: params.publisher, queue: params.queue, shelf: params.shelf)

            LocalDate date
            try{
                date = LocalDate.parse(params.publication)
            } catch(Exception ex){
                date = null
            }

            book.available = true

            book.publication = date

            params.labels.each { label ->

                def tag = Label.get(label as int)

                println tag

                book.addToLabels tag
            }

            params.authors.each { author ->

                def name = Author.get(author as int)

                println name

                book.addToAuthors name
            }

            book.save(flush: true, failOnError: true)

            try {
                book.save(flush: true, failOnError: true)
            } catch (ValidationException ex){
                for (error in ex.getErrors()){
                    message = "Error in " + error.getFieldError().getField() + " field, " + ('unique' == error.getFieldError().getCode() ? "already exist" : "is invalid.")
                    message + "\n"
                }
            }
        } catch (ConstantException ex){
            for (error in ex.getErrors()){
                message = "Error in " + error.getFieldError().getCode() + " field, " + ('unique' == error.getFieldError().getCode() ? "already exist" : "is invalid.")
                message + "\n"
            }
        } catch (Exception ex){
            message = ex.message
        }
        params.keySet().asList().each { if ('param1' != it) params.remove(it) }
        render view: '../userLog/admHome',  model: [authors: Author.list(), books: Book.list(), labels: Label.list(), message: message, user: user]
    }

    @Secured('ROLE_ADMIN')
    def updateDropBook(){
        def user = springSecurityService.currentUser
        def message = ""
        def book = Book.get(params.book as long)

        println "\n" + RestFieldsService.getRestAuthors(book)

        params.keySet().asList().each { if ('param1' != it) params.remove(it) }

        [book: book, message: message, user: user, labels: RestFieldsService.getRestLabels(book), authors: RestFieldsService.getRestAuthors(book)]
    }

    @Secured('ROLE_ADMIN')
    def update(){
        def user = springSecurityService.currentUser
        def message = ""
        def book = Book.get(params.book as int)
        try{
            book.title = params.title
            book.subtitle = params.subtitle
            book.shelf = params.shelf
            book.publisher = params.publisher
            book.queue = params.queue
            book.page = params.pageNumber as int
            book.edition = params.edition as int
            book.isbn = params.isbn
//        book.publication = params.publication

            def labels = book.labels

            labels.each {
                book.removeFromLabels(it)
            }


            for (def label in params.labels){
                book.addToLabels(Label.get(label as int))
            }
            book.authors.removeAll(true)
            for (def author in params.authors){
                book.addToAuthors(Author.get(author as int))
            }

            LocalDate date

            try{
                date = LocalDate.parse(params.publication)
            } catch(Exception ex){
                date = null
            }
            book.publication = date

            book.save(flush: true, failOnError: true)

            message = "Update successed"

        } catch(ConcurrentModificationException ex){
            message = ex.message
        }

//        params.keySet().asList().each { if ('param1' != it) params.remove(it) }
        render view: '../userLog/admHome',  model: [authors: Author.list(), books: Book.list(), labels: Label.list(), message: message, user: user]

    }

    @Secured('ROLE_ADMIN')
    def drop(){
        def user = springSecurityService.currentUser
        def message = ""
        try {
            def book = Book.get(params.book as int)
            book.delete(flush: true)
        } catch (Exception ex){
            println ex.message
            message = "Ainda há itens como autores, labels e emprestimos relacionados a este livro."
        }

        println message
        params.keySet().asList().each { if ('param1' != it) params.remove(it) }
        render view: '../userLog/admHome',  model: [authors: Author.list(), books: Book.list(), labels: Label.list(), message: message, user: user]
    }

    def getMactchedValue(def param, def expression){
        def currentSession = sessionFactory.currentSession
        def q = "select distinct b.id from book as b join book_authors on b.id = book_authors.book_id join author on book_authors.author_id = author.id join book_labels as ba on b.id = ba.book_id join label as l on label_id = l.id where title like('%${expression}%') or full_name like('%${expression}%') or tag like('%${expression}%') limit ${params.max} offset ${params.offset ?: 0};"
        def data = currentSession.createSQLQuery(q)
        def qc = "select distinct count(distinct b.id) from book as b join book_authors on b.id = book_authors.book_id join author on book_authors.author_id = author.id join book_labels as ba on b.id = ba.book_id join label as l on label_id = l.id where title like('%${expression}%') or full_name like('%${expression}%') or tag like('%${expression}%');"
        def count = currentSession.createSQLQuery(qc)

        def totalResults = new ArrayList()

        data.list().each {
            totalResults.add(Book.get(it))
        }

        return [result : totalResults, count : count.list()[0] as int]
    }
}
