package com.library

import grails.plugin.springsecurity.annotation.Secured
import library.LendingsService

import java.time.LocalDate

class LendingController {
    static def springSecurityService

    @Secured('ROLE_ADMIN')
    def create(){
        def message = ""

        def solicitation = Solicitation.get(params.solicitation as int)

        if (solicitation != null){
            solicitation.delete(flush: true)
        }

        def userLog = springSecurityService.currentUser

        def book = Book.get(params.book as int)
        def user = UserLog.get(params.user as int)

        if (book.available){
            LocalDate lendingDay = LocalDate.now()
            LocalDate devolution = lendingDay.plusDays(15)

            def lending = new Lending(book: book, user: user, lending: lendingDay, devolution: devolution, active: true).save(failOnError: true, flush: true)
            lending.active = true
            lending.save()
            book.available = false;
            book.save(failOnError: true, flush: true)
            render (view: '../userLog/admHome', model: [user: userLog, books: Book.list(), lendings: LendingsService.getActiveLendings(), authors: Author.list(), labels: Label.list()])
        }
        else{
            message = "Tis book already is unvaliable"
        }
        render (message: message, view: '../userLog/admHome', model: [user: userLog, books: Book.list(), lendings: LendingsService.getActiveLendings(), authors: Author.list(), labels: Label.list()])


    }

    @Secured(['ROLE_ADMIN'])
    def devolution(){

        def user = springSecurityService.currentUser
        def authority = (Role.findByAuthority('ROLE_ADMIN') in user.authorities)

        def lending = Lending.get(params.lending as int)

        lending.setActive false
        if (lending != null){
            lending.save(failOnError: true)
        }

        def book = lending.book
        book.available = true
        book.save(failOnError: true, flush: true)

        render view: "../userLog/admHome", model: [user: user, books: Book.list(), authors: Author.list(), labels: Label.list(), authority: authority, lendings: LendingsService.getActiveLendings(), solicitations: Solicitation.list()]
    }

}
