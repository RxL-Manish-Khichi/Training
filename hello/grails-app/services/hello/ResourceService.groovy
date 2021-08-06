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

    def topicresourcelist(tid){
        List<Resource> rsc = Resource.createCriteria().list{
            eq("topic.id",tid)

        }
        return rsc

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
            return rsc
        }catch(Exception e){
            return null
        }
    }


    def uploadLinkMethod(params,String name){
        User user = User.findByUsername(name)
        def t = Topic.findByTopicname(params.topicname)
        Long topicId = t.id
        String link = params.link
        LinkResource rsc = new LinkResource(description: params.description,topic:t,url:link)
        user.addToResources(rsc)
        t.addToResources(rsc)
        try{
            rsc.save(flush:true,failOnError:true)
            return rsc
        }catch(Exception e){
            return null
        }

    }



}
