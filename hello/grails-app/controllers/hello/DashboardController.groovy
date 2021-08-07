package hello



class DashboardController {
    def topiclistService
    def topicService
   def subscriptionService
    def resourceService


    def index() {
        User u1=session.getAttribute("user")
        Integer topcount=topiclistService.topiccountMethod(session.user.username)
        Integer subscount=topiclistService.subscribecountMethod(session.user.username)
        List subList = subscriptionService.subscriptions(session.user.username)
        List trending = topiclistService.trendTopicMethod()
       // List resourceList = resourceService.inboxResourceMethod()
        List unread = resourceService.inboxListMethod(session.user.username)

      //  List topic = topiclistService.tlistMethod() ,topic:topic

      //  List resourceList = resourceService.resourceListMethod()
      //  println resourceList

        render(view:"index",model:[u1:u1,topcount:topcount,subscount:subscount,subList:subList,unread:unread,trending:trending])

    }
}
