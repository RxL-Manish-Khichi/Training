package hello

import org.springframework.web.multipart.MultipartFile

class ResourceController {

    def resourceService

  //  def index() { }

    def saveDocument(){
        String name = session.user.username
        def rs= resourceService.uploadDocumentMethod(params,request,name)
        if(rs){
            flash.success="Document Successfully Uploaded"
            redirect(controller:"dashboard",action:"index")
        }
        else{
            flash.error="Failed To Upload"
            redirect(controller:"dashboard",action:"index")

        }
    }

    def editLink(){
        Resource r = Resource.findById(params.id)
        r.description = params.description
        r.url = params.link
        r.save(flush:true,failOnError:true)
        redirect(controller: "resourcerating",action: "index", params:[id:r.id])
    }
    def editDocument(params,request){
        Resource r = Resource.findById(params.id)
        r.description = params.description
        MultipartFile doc = request.getFile('document')
        if(doc && !doc.empty){
            String fName = doc.getOriginalFilename()
            String fPath = "/home/rxlogix/hello/grails-app/assets/documents/" + fName
            File file= new File(fPath)
            doc.transferTo(file)
            r.filePath = fPath
        }
        else{
            r.filePath = r.filePath
        }
        r.save(flush:true,failOnError:true)
        redirect(controller: "resourcerating",action: "index", params:[id:r.id])
    }

    def deleteResource()
    {
        Resource r = Resource.findById(params.get("id"))
        Topic topic = r.topic
        User user = r.createdBy
        println "->>>"
        List<ResourceRating> rt = ResourceRating.findAllByResource(r)
        rt.each {
            it.delete()
        }
        println "stage2"
        user.removeFromResources(r)
        println "stage3"
        topic.removeFromResources(r)
        println ":stage3"
        r.delete(flush:true,failOnError: true)
        println "done"
        redirect(controller: "dashboard",action: "index")
    }



    def saveLink(){
        String name=session.user.username
        def rs = resourceService.uploadLinkMethod(params,name)
        if(rs){
            flash.success="Link Saved"
            redirect(controller:"dashboard",action:"index")

        }
        else{

            flash.error="Failed To Link Saved"
            redirect(controller:"dashboard",action:"index")
        }
    }

    def documentFile(){
        DocumentResource doc = (DocumentResource)Resource.get(params.id)
        def file = new File("${doc.filePath}")
        if(file.exists()){
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition","attachment;filename=\"${file.name}\"")
            response.outputStream << file.bytes
        }
        else render("Error")
    }







}
