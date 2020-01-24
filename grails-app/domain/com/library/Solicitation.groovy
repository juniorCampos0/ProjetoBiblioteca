package com.library

class Solicitation {

    Book book
    UserLog user
    static belongsTo = [UserLog]

    static constraints = {
    }
}
