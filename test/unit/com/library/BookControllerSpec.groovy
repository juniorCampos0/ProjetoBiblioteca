package com.library

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(BookController)
@Mock([Book])
class BookControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "func is funcional"() {
        given: "A function"
            def mae = Book.func()
    }


}
