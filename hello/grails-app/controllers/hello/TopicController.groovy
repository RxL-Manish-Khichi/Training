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
            String username= session.user.username
            def v = topicService.topicMethod(params,username)
            println v
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
  /*  def topiccountMethod(String name){
        Integer tc = User.findByUsername(name).topics.size()
        return tc
    }

    def subscribecountMethod(String name){
        Integer sc= User.findByUsername(name).subscriptions.size()
        return sc
    }

    def trendTopicMethod(){
        List<Topic> trendList = Topic.createCriteria().list(max:5){
            eq('visibility',VisibilityEnum.PUBLIC)
        }
        return trendList
    } */
}
