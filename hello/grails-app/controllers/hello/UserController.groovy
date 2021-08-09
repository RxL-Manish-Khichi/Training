package hello


import grails.validation.ValidationException



class UserController
{
    def loginService
    def registerService
    def userlistService
    def topiclistService
    def topicService
    def updateService
    def resourceService
    def toppostService


    def index() {

        List rsc = resourceService.recentResourceMethod()
        List<Resource> rlist=toppostService.topPost()
        println rsc


        render (view: "index",model: [rsc:rsc,rlist:rlist])
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

 /*   def loginUser(){
        def u = loginService.loginUser(params)
        if(u!= null){
            if(u.password==params.password){
                session.setAttribute('user',u)
                redirect controller:"dashboard",actionName: "index"
            }
            else{
                flash.msg1="password incorrect"
                redirect (actionName: "index")
            }
        }
        else
        {
            flash.message="user not exist"
            redirect(actionName: "index")
        }

    } */

    def loger() {
        def l= User.findByEmail(params.email)
        if (l!= null) {
            if (l.password == params.password) {
                session.setAttribute("user", l)
                redirect(controller: "dashboard", action: "index")
                session.name=l.username
            }
            else {
               // flash.error="Wrong Credentials"
                flash.error = "Wrong credentials"
                redirect(actionName: "index")
            }
        }
        else {
            flash.msg3="Invalid Mail"
            redirect(actionName: "index")
        }
    }

    def logout() {
        session.invalidate()
        redirect(controller: "user",action: "index")
    }

    def userlist(){
        List<User> list=userlistService.listMethod()
        render(view:"userlist",model:[userl:list])
    }

  /*  def usereprofile(){

        User u1=session.getAttribute("user")
        render(view: "userprofile",model: [u1:u1])
    } */

    def toplist(){
        List<Topic> list=topiclistService.tlistMethod()
        render(view:"topiclist",model:[topicl:list])
    }




    def editprof(){
      //User u=session.getAttribute("user")
        List list=User.findByUsername(session.user.username).topics.asList()
        println list
        Integer topcount=topiclistService.topiccountMethod(session.user.username)
        Integer subscount=topiclistService.subscribecountMethod(session.user.username)

        render(view: "editprofile",model:[ulist:list,topcount:topcount,subscount:subscount])
    }

   def updatePassword(){
        if(params.password==params.confirmpassword){
            User u=session.getAttribute("user")
            User u1=User.get(u.id)
            u1.firstname=u.firstname
            u1.lastname=u.lastname
            u1.username=u.username
            u1.email=u.email
            u1.photo=u.photo
            u1.password= params.password
            u1.confirmpassword=params.confirmpassword
            // println u1.cofirmpassword
            try{
            u1.save(flush:true)
            session.setAttribute("user",u1)
                flash.success="Password updated successfully"
                redirect(controller: "user",action: "editprof")
        }catch(Exception e){
            flash.error = "Failing in updation "
            return
            }
        }

    }


    def updateProfile()
    {
        User u=session.getAttribute("user")
        User u1=User.get(u.id)
        u1.firstname=params.firstname
        u1.lastname=params.lastname
        u1.username=params.username
        u1.password=u1.confirmpassword
        u1.email=u1.email
        def file = request.getFile('image')
        if (file && !file.empty) {
            File photo = new File("/home/rxlogix/hello/grails-app/assets/images/photof/${params.username}.png")
            file.transferTo(photo);

            u1.photo= "/photof/${params.username}.png"
        }
        u1.confirmpassword=u1.confirmpassword
        try{
            u1.save(flush:true)
            flash.success= 'Profile updated successfully'
            session.setAttribute("user",u1)
            redirect(controller: "user",action: "editprof")

        }catch(Exception e){
            flash.error="Password updated successfully"
            return

        }


    }

    def posts(){
        render(view: "posts")
    }

    def activateUser(){
        User user = User.findByUsername(params.name)
        if(user.isActive()){
            flash.message="User is Already Active"
        }
        else{
            user.active=true
            user.save(flush:true,failOnError:true)
        }
        redirect(controller:"user",action: "userlist")

    }

    def deActivateUser(){
        User user = User.findByUsername(params.name)
        if(user.isActive()){
            user.active=false
            user.save(flush:true,failOnError:true)

        }
        else{
            flash.message="User is Already Not Active"
        }
        redirect(controller:"user",action: "userlist")


    }

    def makeAdmin(){
        User user=User.findByUsername(params.name)
        user.admin=true
        user.save(flush:true,failOnError:true)
        redirect(controller:"user",action: "userlist")
    }


    def forgotPassword(){
       // println "mani"
        User u = User.findByEmail(params.get("email"))
        println u

            if(u.securityQuestion==(params.get("securityQuestion") as String))
            {
                u.password = params.get("password");
                u.confirmpassword = params.get("confirmpassword")
                u.username = u.username
                u.firstname=u.firstname
                u.lastname=u.lastname
                u.securityQuestion = u.securityQuestion
                u.photo = u.photo
                u.email = u.email
                u.save(flush:true,failOnError:true)
                flash.success="PassWord Changed Successfully"
                redirect(controller: "user",action: "index")
            }
            else{
                flash.error="Wrong Security Answer"
                redirect(actionName: "index")
            }
        }

















/*    def updateProfile(){
        String name= session.user.username
        def u1 = updateService.updateProfile(params,request,name)
        if(u1){
            flash.success="Profile Updated Successfully"
            session.getAttribute("user")
            redirect(controller: "user",action:"editprof")
        }
        else{
            flash.error ="Error in updation- Try Again"
            return
        }
    }
    */

   /*  def updatePassword(){
        String name = session.user.username
        if(params.password==params.confirmpassword){
            def u = updateService.updatePassword(params,name)
            if(u){
                flash.success="Password Successfully Updated"
                redirect(controller:"user",action: "editprof")
            }
            else{
                flash.error="Error in updating password! try again"
                return
            }
        }
    } */

  /*  def usercheckhql(){
        List ll= User.executequery("select firstname,lastname from User ) */
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



