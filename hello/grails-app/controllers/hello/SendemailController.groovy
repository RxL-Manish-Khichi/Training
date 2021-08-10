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
}
