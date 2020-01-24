package com.library

class Label {

    String tag

    static constraints = {
        tag size: 3..15, nullable: false
        books nullable: true
    }

    static hasMany = [books: Book]
    static belongsTo = Book
}
