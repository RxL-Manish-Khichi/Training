package hello

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ServiceControllerSpec extends Specification implements ControllerUnitTest<ServiceController> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
