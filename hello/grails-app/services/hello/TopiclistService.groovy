package hello

import grails.gorm.transactions.Transactional

@Transactional
class TopiclistService {

    def tlistMethod() {
        List topicl= Topic.list()
        return topicl

    }

    def topiccountMethod(String name){
        Integer tc = User.findByUsername(name).topics.size()
        return tc
    }

    def subscribecountMethod(String name){
        Integer sc= User.findByUsername(name).subscriptions.size()
        return sc
    }
}
