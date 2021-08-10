package hello

import grails.gorm.transactions.Transactional

import javax.validation.ValidationException

@Transactional
class RegisterService {

    def registerMethod(Map params,def request) {
        User ru = new User(params)

        def file = request.getFile('image')
       // def name = file.getOriginalFilename()
      //  println "file is "+name
        if (file && !file.empty) {
            File file2 = new File("/home/rxlogix/hello/grails-app/assets/images/photof/${params.username}.png")
            file.transferTo(file2);
           // println(file2.path)
            ru.photo= "/photof/${params.username}.png"
        }else{
            ru.photo = "/home/rxlogix/hello/grails-app/assets/images/photof/noimageupload.png"
        }


        try{
            ru.save(flush:true,failOnError:true)
            if(ru.id==1){
                ru.admin=true
                ru.save(flush:true,failOnError:true)
            }
            return ru

    }catch(Exception e){
            return null
        }
    }
}
