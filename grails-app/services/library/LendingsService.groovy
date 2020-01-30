package library

import com.library.Book
import com.library.Lending
import com.library.UserLog
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional
class LendingsService {
    static def getLendings(UserLog user){
        def books = new ArrayList()

        def lendingsByActive = Lending.findAllByActive(true)
        def lendingsByUser = Lending.findAllByUser(user)

        def lendings  = lendingsByActive.intersect(lendingsByUser)

        for (lending in lendings){
            books.add(lending.getBook())
            println lending.getBook()
        }

        return books
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    static def getHistory(UserLog user){

        def lendings = new ArrayList()

        lendings.addAll(Lending.findAllByUser(user) as List)

        def books = new ArrayList()

        for (def lending in lendings){
            books.add(lending.book)
        }

        return lendings
    }


    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    static def getAllLendings() {
        def lendings = new ArrayList()

        lendings.addAll(Lending.findAllByActive(true) as List)

        return lendings
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    static def getActiveLendings() {
        def lendings = new ArrayList()

        lendings.addAll(Lending.findAllByActive(true) as List)

        def books = new ArrayList()

        lendings.each {
            books.add(it.book)
        }

        return books
    }

    static def getRecomendation(UserLog user) {

        def size = getHistory(user).size()

        size = 10 < size ? 10 : size

        def history = getHistory(user).sort {it.id}.subList(0,size)

        def labels = new ArrayList()
        def authors = new ArrayList()

        for (lending in history){
            labels.addAll(lending.book.labels)
            authors.addAll(lending.book.authors)
        }
        labels.unique()

        def books = new ArrayList()

        for (book in Book.list()){
            for (label in labels){
                if(label in book.labels){
                    books.add(book)
                }
            }
        }

        authors.each {
            books.addAll(it.books)
        }

        books.unique()
        return books

    }
}
