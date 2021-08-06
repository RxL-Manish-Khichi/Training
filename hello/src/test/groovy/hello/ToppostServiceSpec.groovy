package hello

import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class ToppostServiceSpec extends Specification implements ServiceUnitTest<ToppostService>{

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
