package hello

class MarkreadController {
    def resourceService


    def index() { }
    def markAsRead(){
        String name = session.user.username
        resourceService.markReadMethod(params,name)
        redirect(controller:"dashboard",action:"index")

    }
   /* {
        User u = session.getAttribute("user")
        println params.get("id")
        User u1 = User.findById(u.id)
        Resource r = Resource.findById(params.get("id") as long)
        ReadingItem item = ReadingItem.findByUserAndResource(u1,r)
       // println item.isRead
        item.isRead = true
        item.user = u
        item.resource =r
        item.save(flush:true)
        session.setAttribute("user",u)
        redirect(controller:"dashboard",action:"index")

    } */
}
