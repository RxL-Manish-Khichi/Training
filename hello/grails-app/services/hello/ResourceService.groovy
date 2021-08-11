package hello

import org.springframework.web.multipart.MultipartFile
import Enums.VisibilityEnum

import grails.gorm.transactions.Transactional

@Transactional
class ResourceService {

    def resourceListMethod(){
        List<Resource> rsc = Resource.list()
        return rsc
    }

    def sumRating(id){
        Resource rsc = Resource.findById(id)
        Long sum = ResourceRating.createCriteria().get{
            projections{
                avg("score")
            }
            eq("resource",rsc)
        }
        return sum
    }

    def topicresourcelist(tid){
        List<Resource> rsc = Resource.createCriteria().list{
            eq("topic.id",tid)

        }
        return rsc

    }

    def inboxResourceMethod(){
        List<Resource> inb = Resource.list()
        return inb
    }

    def inboxListMethod(name){
        User user = User.findByUsername(name)
        List unList = ReadingItem.createCriteria().list{
            eq('isRead',false)
            eq('user.id',user.id)
        }
        return unList

    }

    def markReadMethod(params,name){
        Long resId = Long.parseLong(params.id)
        User user = User.findByUsername(name)
        ReadingItem readItem = ReadingItem.createCriteria().get{
            eq('resource.id',resId)
            eq('user.id',user.id)
        }
        readItem.isRead = true
        readItem.save(flush:true)

    }

  def recentResourceMethod(){
        List<Resource> rsc = Resource.createCriteria().list {
            "topic" {
                eq("visibility", VisibilityEnum.PUBLIC)

            }
        }


        rsc.sort{
            x,y -> y.dateCreated <=> x.dateCreated
        }
      return rsc
    }

    def uploadDocumentMethod(params,request,String name) {
        User user = User.findByUsername(name)
        def t=Topic.findByTopicname(params.topicname)
        println t
        // Long topicId=t.id
        MultipartFile doc = request.getFile('document')
        String fname = doc.getOriginalFilename()
        String fpath = "/home/rxlogix/hello/grails-app/assets/documents/" + user.username + fname
        File file = new File(fpath)
        doc.transferTo(file)
        Resource rsc = new DocumentResource(description: params.description,topic:t,filePath: fpath,createdBy: user)
        user.addToResources(rsc)
        t.addToResources(rsc)
        try{
            rsc.save(flush:true,failOnError:true)
            List subscriberList = subscribersList(t.id)
            addToUnreadItem(subscriberList,rsc)
            return rsc
        }catch(Exception e){
            return null
        }
    }


    def uploadLinkMethod(params,String name){
        User user = User.findByUsername(name)
        def t = Topic.findByTopicname(params.topicname)
       // Long topicId = t.id
        String link = params.link
        LinkResource rsc = new LinkResource(description: params.description,topic:t,url:link)
        user.addToResources(rsc)
        t.addToResources(rsc)
        try{

            rsc.save(flush:true,failOnError:true)
            List subscriberList = subscribersList(t.id)
            addToUnreadItem(subscriberList,rsc)
            return rsc
        }catch(Exception e){
            return null
        }

    }

    def subscribersList(topicId){
        List userIds = Subscription.createCriteria().list(){
            eq('topic.id',topicId)
        }
        return userIds
    }

    def userResourceList(name){
        List list = User.findByUsername(name).resources.asList()
        return list
    }

    def addToUnreadItem(subscriberList,newResource){
        Boolean isRead = false
        subscriberList.each{
            User us = it.user
            ReadingItem readItem = new ReadingItem(isRead:isRead,resource: newResource,user:us)
            try {
                readItem.save(flush:true,failOnError:true)
                try{
                    us.addToReadingitems(readItem)
                    newResource.addToReadingItem(readItem)
                    us.save(flush:true,failOnError:true)
                    newResource.save(flush:true,failOnError: true)
                }catch(Exception e){
                    return null

                }

            }catch(Exception e){
                return null

            }
        }

    }




}
