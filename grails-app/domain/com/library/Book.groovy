package com.library

import org.springframework.format.annotation.DateTimeFormat
import java.time.LocalDate

class Book {
    String title
    String subtitle
    String isbn
    int page

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    LocalDate publication

    String publisher
    int edition
    // se está emprestado
    Boolean available
    String shelf
    String queue
    Lending lending

    static constraints = {
        isbn unique: false, nullable: false
        title size: 3..50, nullable: false
        subtitle nullable: true, size:0..100
        publisher nullable: true, size: 0..50
        publication nullable: true
        shelf size: 1..15, blank: true, nullable: true
        queue size: 1..15, blank: true, nullable: true
        lending nullable: true
        available nullable: true
    }

    static hasMany = [labels: Label, authors: Author]


}
