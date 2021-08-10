package hello


class TopicController {

    def topicService
    def subscriptionService
    def resourceService

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


    def viewTopic(){
        Long tid
        Long id = Long.parseLong(params.id)
        println id
        Subscription sub = Subscription.get(id)
        if(sub){
            topic t = sub.topic
            tid = t.id

        }else{
            tid=id
        }
        Topic topic = Topic.findById(tid)
        Integer subsCount = topic.subscribers.size()
        Integer postCount = topic.resources.size()
        List subList = subscriptionService.topicSubscribers(tid)
        List resourceList = resourceService.topicresourcelist(tid)
        render(view:"topicshow",model:[topic:topic,subs:sub,subscount:subsCount,postcount:postCount,subscriber:subList,resourceList:resourceList])

    }

    def deleteTopic()
    {
        println(params)
        Topic t=Topic.findById(params.id)
        println params.id
        t.delete(flush:true)
        redirect(controller:"dashboard",action: "index")
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
