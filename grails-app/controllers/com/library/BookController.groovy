package com.library


import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import groovyjarjarantlr.collections.List
import library.RestFieldsService
import library.UserLendingService
import org.springframework.core.ConstantException

import java.text.SimpleDateFormat
import java.time.LocalDate

class BookController {

    def springSecurityService

    static defaultAction = "index"

    @Secured('permitAll')
    def index(){
        def user = springSecurityService.currentUser
        params.keySet().asList().each { if ('param1' != it) params.remove(it) }
        [books: Book.list(), authors: Author.list(), user: springSecurityService.currentUser, lendings: UserLendingService.getBooksInLending(user)]
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
            book.labels.removeAll(true)
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

}

