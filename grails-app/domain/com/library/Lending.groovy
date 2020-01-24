package com.library

import java.time.LocalDate

class Lending {

//    Devolução
    LocalDate devolution
    LocalDate lending
    boolean active
    UserLog user
    Book book


    static constraints = {
        book nullable: true
        lending nullable: true
        devolution nullable: true
    }

    static hasOne = [Book]

}
