package hello

import grails.gorm.transactions.Transactional

@Transactional
class TopiclistService {

    def tlistMethod() {
        List topicl= Topic.list()
        return topicl

    }
}
