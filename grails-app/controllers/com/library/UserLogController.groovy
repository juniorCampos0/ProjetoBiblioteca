package com.library


import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import library.LendingsService
import org.springframework.core.ConstantException
import library.UserLendingService


class UserLogController {



    def springSecurityService

    static defaultAction = "index"

    @Secured(["ROLE_USER", "ROLE_ADMIN"])
    def home(){
        def lendings = LendingsService.getActiveLendings()
        def user = springSecurityService.currentUser

        if (user == null){

        }
        def authority = (Role.findByAuthority('ROLE_ADMIN') in user.authorities)

        if (authority){
            render(view: 'admHome', model:[user: user, books: Book.list(), authors: Author.list(), labels: Label.list(), authority: authority, activeLendings: LendingsService.getAllLendings(), lendings: LendingsService.getLendings(), solicitations: Solicitation.list()])
        } else {
            render(view: 'commomHome', model:[user: user, books: LendingsService.getHistory(user), authority : authority, history: LendingsService.getHistory(user), lendings: LendingsService.getLendings(user), recomendation: LendingsService.getRecomendation(user)])
        }
    }

    @Secured("permitAll")
    def addUser(){
        [message:""]
    }

    @Secured('permitAll')
    def createUser(){
        def userStandard = springSecurityService.currentUser
        def message = ""
        try {
            def role = Role.findByAuthority('ROLE_USER')

            if (role == null){
                role = new Role('ROLE_USER').save()
            }

            def user = new UserLog(nome: params.name, endereco: params.adress, username: params.loginName, telefone: params.phoneNumber, password: params.password, role: role).save()

            def roleUser = new UserLogRole(userLog: user, role: role).save(flush: true)

            try {
                user.save(failOnError: true)
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
        render view: '../book/index', model: [user: userStandard, books : Book.list(), authors: Author.list(), labels: Label.list()]
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN"])
    def loan(){

    }

}
