package hello

import grails.gorm.transactions.Transactional

@Transactional
class LoginService {

    def loginUser(params) {
        def u = User.findByEmail(params.email);
        if (u != null && (u.email == params.email)) {
            return u
        } else {
            return null
        }

    }
}
