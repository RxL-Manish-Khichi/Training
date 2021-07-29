package hello

class DashboardController {

    def index() {
        User u1=session.getAttribute("user")
        render(view:"index",model:[u1:u1])
    }
}
