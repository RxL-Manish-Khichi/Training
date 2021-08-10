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
        List<Topic> trendList = Topic.createCriteria().list(){
            eq('visibility',VisibilityEnum.PUBLIC)
        }
        Integer s = trendList.size()
        trendList.sort{
            x,y -> y.resources.size() <=> x.resources.size()
        }
        if(s>5){
            Integer t = s-5
            return trendList.dropRight(t)

        }else{
            return trendList
        }

    }

}
