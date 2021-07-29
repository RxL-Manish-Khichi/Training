package hello

import grails.gorm.transactions.Transactional

@Transactional
class LoginService {

    def loginMethod(params,def request) {
        User user=User.findByEmail(params.email)
        if(params.password==null || params.email==null || !user)
        {
            return null
        }
        else if(user.email==params.email){
            return user
        }
        else{
            return null
        }

    }
}
