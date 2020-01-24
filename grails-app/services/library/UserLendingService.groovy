package library

import com.library.Book
import com.library.Lending
import com.library.UserLog
import grails.transaction.Transactional

@Transactional
class UserLendingService {

    static def getBooksInLending(UserLog user) {
        if (user == null){
            return new ArrayList<Book>()
        }
        def lendings = user.lending

        def books = new ArrayList()

        for (Lending lend in lendings){
            books.add(Book.get(lend.bookId))
        }

        return books
    }
}
