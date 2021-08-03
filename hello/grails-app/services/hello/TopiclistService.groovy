package hello

import Enums.VisibilityEnum

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

    def trendTopicMethod(){
        List<Topic> trendList = Topic.createCriteria().list(max:5){
            eq('visibility',VisibilityEnum.PUBLIC)
        }
        return trendList
    }

}
