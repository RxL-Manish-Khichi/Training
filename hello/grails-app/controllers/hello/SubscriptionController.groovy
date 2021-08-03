package hello
import Enums.SeriousnessEnum

class SubscriptionController {

    def subscribe(params) {
        User user = User.findByUsername(session.user.username)
        Topic t = Topic.get(params.id)
        Subscription s = new Subscription(SeriousnessEnum.CASUAL,t)
        t.addToSubscribers(s)
        user.addToSubscriptions(s)
        s.save(flush:true,failOnError:true)
        user.save(flush:true,failOnError:true)
        redirect(controller:"dashboard",action:"index")
    }
}
