package hello

class SendemailController {

    def index() { }

    def send() {
        User user = User.findByEmail(params.email)
        if(user) {
            Topic topic = Topic.findByTopicname(params.topicname)
            Long topicId = topic.id
            String link = "http://localhost:8092" + createLink(controller: "subscription", action: "sendSubscriptionInvite", params: [id: topicId, email: user.email])


            sendMail {
                to "${params.email}"
                subject "Hello ${user.firstname},You have been invited to join the Topic ${topic.topicname}"
                text link
            }

            flash.message = "Message sent at " + new Date()
            redirect(controller: "dashboard", action: "index")
        }
        else {
            flash.error="No Such User Exist"
            redirect(controller: "dashboard",action: "index")
        }
    }


        /*def resetPassword(){
            User user = User.findByEmail(params.email)
            if (user) {
                def token = Token.findByEmail(user.email)
                if(!token) {
                    String val = UUID.randomUUID().toString().replaceAll('-', '')
                    token = new Token(email: user.email,value: val)
                    token.save(flush: true);
                }
                String link = "http://localhost:8082" + createLink(controller: 'user', action: 'ResetPasswordEmail',params:[name:user.username,token:token.value])
                sendMail {
                    to "${user.email}"
                    subject "Hello ${user.firstname} Your password reset link is here!!!"
                    text link
                }
                flash.success = "Check Your Mail"
                redirect(controller: "user", action: "forgetPassword")
            } else {
                flash.error = "no such user exist, register"
                redirect(controller: "user", action: "forgetPassword")
            }
        }*/

    /*def ResetPasswordEmail() {
        String value = params.token
        def token =Token.findByValue(value)
        if(token) {
            render(controller: "user", view: 'resetNewPass', model: [name: params.name])
        }
        else{
            redirect(url: "/")
        }
    }*/

    /*def resetPassword(){
        String name = params.name
        if(params.newPassword==params.newConfirmPassword){
            def u = updateService.updatePassword(params,name)
            if(u){
                flash.message1 = "password updated successfully"
                redirect(url: "/")
            }
            else{
                flash.error = "Error Try again"
                redirect(url: "/")
            }
        }
        else{
            flash.message = "password not match"
            redirect(url: "/")
        }

    }*/

}
