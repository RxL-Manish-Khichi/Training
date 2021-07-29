package hello

import grails.gorm.transactions.Transactional

@Transactional
class TopicService {

    def topicMethod(Map params,username) {
        User user = User.findByUsername(username)
        Topic topic=new Topic(params)
        user.addToTopics(topic)

        if(topic.validate())
        {
            topic.save(flush:true,failOnError:true)
            user.save(flush:true)
            return topic
        }
        else
        {
            topic.errors.getAllErrors()
            return null
        }

    }
}
