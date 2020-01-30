package com.library

import grails.plugin.springsecurity.annotation.Secured


@Secured('permitAll')
class Author {
    String fullName
    Set books

    static constraints = {
        fullName size: 3..100
    }
    static hasMany = [books: Book]
    static belongsTo = [Book]
}
