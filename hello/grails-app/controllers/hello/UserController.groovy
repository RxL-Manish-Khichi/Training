package hello

import grails.validation.ValidationException



class UserController {
    def loginService
    def registerService
    def userlistService

    def index() {
        render view: "index"
    }

    def ruser() {
        if (User.findByEmail(params.email))
        {
            flash.msg1 = " Email already exists"
            redirect(action: "index")
        }else if (User.findByUsername(params.username)){
            flash.msg2 = "Username already exits"
            redirect(action: "index")
        } else if(params.password==params.confirmpassword) {
            def x = registerService.registerMethod(params,request)
            if (x) {
                session.name = x.email
                flash.success = "Registeration Successful,Now You Can Login"
                redirect(controller: "user", action: "index")
            } else {
                flash.error = "Registeration Failed- Try to Register Again"
            }
        }
            else{
                flash.msg3="Unmatched Password"
                redirect(actionName: "index")
            }
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

    def logout() {
        session.invalidate()
        redirect(controller: "user",action: "index")
    }

    def userlist(){
        List<User> list=userlistService.listMethod()
        render(view:"userlist",model:[userl:list])
    }

    def usereprofile(){
        render(view: "userprofile")
    }





    }



   /*     User ru = new User(params)


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

    } */



