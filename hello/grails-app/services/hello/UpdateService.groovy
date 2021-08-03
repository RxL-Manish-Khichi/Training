package hello

import grails.gorm.transactions.Transactional

@Transactional
class UpdateService {

    def updateProfile(Map params,request,String name) {
        User user = User.findByUsername(name)
        user.username = params.username
        user.firstname = params.firstname
        user.lastname = params.lastname
        def file = request.getFile('image')
        if (file && !file.empty) {
            File photo2 = new File("/home/rxlogix/hello/grails-app/assets/images/photof/${user.username}.png")
            file.transferTo(photo2);
            user.photo= "/photof/${user.username}.png"
        }
        try{
            user.save(flash:true,failOnError:true)
            return user
        }catch(Exception e){
            return null
        }

    }

    def updatePassword(Map params,String name){
        User user= User.findByUsername(name)
        user.password = params.password
        try{
            user.save(flush:true,failOnError:true)
            return user
        }catch(Exception e){
            return null
        }
    }
}
