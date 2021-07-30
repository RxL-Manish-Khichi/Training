package hello

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
            return topic
        }catch(Exception e) {

            println e
            return null
        }

    }
}
