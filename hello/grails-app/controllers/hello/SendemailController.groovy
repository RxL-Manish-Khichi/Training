package hello

class SendemailController {

    def index() { }

    def send() {
        sendMail {
            to "${params.email}"
            subject "Hello,You have been invited to join the Topic"
            text "You are invited to join Topic ${params.topicname}"
        }

        flash.message = "Message sent at "+new Date()
        redirect(controller:"dashboard",action:"index")
    }
}
