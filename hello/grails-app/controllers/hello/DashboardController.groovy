package hello

class DashboardController {
    def topiclistService

    def index() {
        User u1=session.getAttribute("user")
        Integer topcount=topiclistService.topiccountMethod(session.user.username)
        Integer subscount=topiclistService.subscribecountMethod(session.user.username)
        render(view:"index",model:[u1:u1,topcount:topcount,subscount:subscount])

    }
}
