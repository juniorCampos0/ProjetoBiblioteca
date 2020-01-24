package library

import com.library.Author
import com.library.Book
import com.library.Label
import grails.transaction.Transactional

@Transactional
class RestFieldsService {

    static def getRestLabels(Book book) {
        if (Label == null){
            return new ArrayList();
        }

        def labels = new ArrayList()

        for (label in Label.list()){
            if (!(label in book.labels)){
                labels.add(label)
            }
        }

        return labels
    }

    static def getRestAuthors(Book book) {
        if (Author == null){
            return new ArrayList();
        }

        def authors = new ArrayList()

        for (author in Author.list()){
            if (!(author in book.authors)){
                authors.add(author)
            }
        }

        return authors
    }
}
