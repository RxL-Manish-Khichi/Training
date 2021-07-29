package hello

class TopicController {

    def topicService


    def topicadd() {
        Topic t=Topic.findByTopicname(params.topicname)
        if(t){
            flash.msgt="Topic With same Name already exists"
            redirect(controller:"dashboard",action:"index")
        }
        else{
            String username= session.name
            def v = topicService.topicMethod(params,username)
            if(v){

                flash.success="Topic successfully Added"
                redirect(controller:"dashboard",action: "index")

            }
            else
            {
                flash.error ="Topic Not created"
            }
        }
    }
}
