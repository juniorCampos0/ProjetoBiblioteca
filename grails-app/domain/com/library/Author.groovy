package com.library

class Author {
    String fullName

    static constraints = {
        fullName size: 3..100
    }
    static hasMany = [books: Book]
    static belongsTo = [Book]

}
