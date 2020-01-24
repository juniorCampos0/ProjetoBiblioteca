package com.library

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.springframework.core.ConstantException

class LabelController {

    def springSecurityService

    @Secured('ROLE_ADMIN')
    def addLabel(){
        def message = ""
        def user = springSecurityService.currentUser
        [user: user, message: message]
    }

    @Secured('ROLE_ADMIN')
    def createLabel(){
        def user = springSecurityService.currentUser
        def message = ""
        try {
            def label = new Label(tag: params.addLabel)
            try {
                label.save(failOnError: true)
                message = "Label successfully registered"
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
    def updateDropLabel(){
        def user = springSecurityService.currentUser
        def label = Label.get(params.label as int)

        [user: user, label: label]

    }

    @Secured('ROLE_ADMIN')
    def update(){
        def message = ""
        def user = springSecurityService.currentUser
        def label = Label.get(params.label as int)
        label.tag = params.tag
        label.save(flush: true)
        render view: '../userLog/admHome',  model: [authors: Author.list(), books: Book.list(), labels: Label.list(), message: message, user: user]

    }

    @Secured('ROLE_ADMIN')
    def drop(){
        def message = ""
        def user = springSecurityService.currentUser

        def label = Label.get(params.label as int)

        try {
            label.delete()
        } catch (Exception ex){
            message = "Ainda há livros ligados a essa label"
        }

        println message
        render view: '../userLog/admHome',  model: [authors: Author.list(), books: Book.list(), labels: Label.list(), message: message, user: user]
    }

}
