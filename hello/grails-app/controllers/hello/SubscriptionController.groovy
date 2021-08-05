package hello
import Enums.SeriousnessEnum

class SubscriptionController {

    def subscribe(params) {
        User user = User.findByUsername(session.user.username)
        Topic t = Topic.findById(params.id)
        println t
        println params.id
        Subscription s = new Subscription(seriousness:SeriousnessEnum.CASUAL,topic:t)
        t.addToSubscribers(s)
        user.addToSubscriptions(s)
        s.save(flush:true,failOnError:true)
        user.save(flush:true,failOnError:true)
        redirect(controller:"dashboard",action:"index")
    }


    def unsubscribe(params){
        User user = User.findByUsername(session.user.username)
        Subscription s = Subscription.findById(params.id)
        s.delete(flush: true)
        redirect(controller: "dashboard",action: "index")

    }

    def unsubtrend(params){
        User user = User.findByUsername(session.user.username)
        Long topid = Long.parseLong(params.id)
        Subscription sub = Subscription.createCriteria().get{
            eq('topic.id',topid)
            eq("user.id",user.id)

        }
        Subscription s= Subscription.findById(sub.id)
        s.delete(flush:true)
        redirect(controller: "dashboard",action: "index")


    }
}
