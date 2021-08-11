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

    def changeVisibility(){
        Topic topic = Topic.get(params.id1)
        topic.visibility=params.visibility
        try{
            topic.save(flush:true,failOnError:true)
        }catch(Exception e){
            flash.error="error"
        }
        redirect(controller: "dashboard",action: "index")
    }

    def changeSeriousness(){
        Subscription subscription = Subscription.get(params.id)
        if(subscription){
            subscription.seriousness=params.seriousness
            try{
                subscription.save(flush:true,failOnError:true)
            }catch(Exception e){
                flash.error="error"
            }
            redirect(controller: "dashboard",action: "index")


        }
        else{
            User u = User.findByUsername(session.user.username)
            Topic t=Topic.findById(params.id)
            Subscription sub = Subscription.findByUserAndTopic(u,t)
            sub.seriousness=params.seriousness
            try{
                sub.save(flush:true,failOnError:true)
            }catch(Exception e){
                flash.error="error"

            }
            redirect(controller: "dashboard",action: "index")
        }
    }

    def sendSubscriptionInvite() {
        if (!session.user) {
            flash.mess = "login first"
            redirect(controller: "user", actionName: "index")
        } else {
            Long topid = Long.parseLong(params.id)
            User user = User.findByEmail(params.email)
            Topic topic = Topic.get(topid)
            Subscription sub = Subscription.findByTopicAndUser(topic, user)
            if (session.user.username != user.username) {
                flash.message = "Login as ${user.firstname}"
                session.invalidate()
                redirect(controller: "user", action: "index")
            } else {
                if (sub == null) {
                    Subscription sub1 = new Subscription(seriousness: "CASUAL")
                    topic.addToSubscribers(sub1)
                    user.addToSubscriptions(sub1)
                    topic.save(flush: true)
                    user.save(flush: true, failOnError: true)
                    sub1.save(flush: true, failOnError: true)
                    flash.message2 = "Subscribed Successfully"
                    redirect(controller: "dashboard", action: "index")

                } else {
                    flash.message2 = "You are already subscribed in this topic!"
                    redirect(controller: "dashboard", action: "index")
                }
            }

        }

    }

}
