package com.library

import grails.validation.ValidationException
import org.springframework.core.ConstantException
import org.springframework.security.access.annotation.Secured
import library.UserLendingService

class AuthorController {

    def springSecurityService


    @Secured('permitAll')
    def authorList(){
        def user = springSecurityService.currentUser
        def authors = Author.list()
        [authors: authors, user: user, lendings: UserLendingService.getBooksInLending(user)]
    }

    @Secured('ROLE_ADMIN')
    def addAuthor(){
        def user = springSecurityService.currentUser
        def message = ""
        [user: user, message: message]
    }

    @Secured('ROLE_ADMIN')
    def createAuthor(){
        def user = springSecurityService.currentUser
        def message = ""
        try {
            def author = new Author(fullName: params.fullName)
            try {
                author.save(failOnError: true)
                message = "Author successfully registered"
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
        }
        render view: '../userLog/admHome',  model: [authors: Author.list(), books: Book.list(), labels: Label.list(), message: message, user: user]
    }

    @Secured('ROLE_ADMIN')
    def updateDropAuthor(){
        def user = springSecurityService.currentUser
        def message = ""
        def author = Author.get(params.author as long)

        [author: author, message: message, user: user]
    }

    @Secured('ROLE_ADMIN')
    def update() {
        def user = springSecurityService.currentUser

        println params.author

        def author = Author.get(params.author as int)
        def message = "Update successfully"

        author.fullName = params.fullName

        author.save(flush: true)
        render view: '../userLog/admHome',  model: [authors: Author.list(), books: Book.list(), labels: Label.list(), message: message, user: user]
    }

    @Secured('ROLE_ADMIN')
    def drop(){
        def user = springSecurityService.currentUser
        def author = Author.get(params.author as int)
        def message = "Author deleted with success"
        try {
            author.delete(flush: true)
        } catch (Exception ex){
            message = "Autor não pode ser deletado, existem livros relacionados a ele."
        }

        render view: '../userLog/admHome',  model: [authors: Author.list(), books: Book.list(), labels: Label.list(), message: message, user: user]

    }

}
