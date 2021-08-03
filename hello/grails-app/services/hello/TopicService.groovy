package hello

import Enums.SeriousnessEnum

import grails.gorm.transactions.Transactional

@Transactional
class TopicService {

    def topicMethod(Map params,username) {
        User user = User.findByUsername(username)
        Topic topic=new Topic(params)
        user.addToTopics(topic)

        try
        {
            topic.save(flush:true,failOnError:true)
            user.save(flush:true)
           Subscription subscription = new Subscription(seriousness:SeriousnessEnum.VERY_SERIOUS)
            user.addToSubscriptions(subscription)
            topic.addToSubscribers(subscription)
            try{
                subscription.save(flush:true,failOnError:true)

            }catch(Exception e){
                return null
            }
            return topic
        }catch(Exception e) {

            println e
            return null
        }

    }
}
