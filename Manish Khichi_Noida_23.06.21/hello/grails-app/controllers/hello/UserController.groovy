package hello

import grails.validation.ValidationException



class UserController {

    def index() {
        render view: "index"
    }

    def ruser() {

        User ru = new User(params)

        def file = request.getFile('image')
        def name = file.getOriginalFilename()
        println "file is "+name
        if (file && !file.empty) {
            File file2 = new File("/home/rxlogix/hello/grails-app/assets/images/photof/${params.username}.png")
            file.transferTo(file2);
            println(file2.path)
            ru.photo= "/photof/${params.username}.png"
        }


        try{
            ru.save(flush:true,failOnError:true)
           flash.success = "Successfully Registered"

        } catch(ValidationException e){
          flash.error = "Registration Failed"
       }
        redirect(actionName:"index")

    }

    def loger() {
        def l= User.findByEmail(params.email)
        if (l!= null) {
            if (l.password == params.password) {
                session.setAttribute("user", l)
                redirect(controller: "dashboard", action: "index")
                session.name=l.username
            }
              else {
                render("Wrong Credentials")
                return
            }
        }
        render("Incorrect Email ")
        return
    }
}