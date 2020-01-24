package com.library

import grails.plugin.springsecurity.annotation.Secured

class SolicitationController {

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def request(){

        def book = Book.get(params.book as int)
        UserLog user = UserLog.get(params.user as int)

        def solicitation = new Solicitation(book: book, user: user).save(failOnError: true)

        render view: '../book/bookView', model: [book: book, user: user, avaliable: book.available, books: Book.list()]
    }
}
