package hello

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class ViewtestControllerSpec extends Specification implements ControllerUnitTest<ViewtestController> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
