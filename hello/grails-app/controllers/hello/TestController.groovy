package hello

class TestController {
    static defaultAction = "allTopics"

    def index() {
        render("Sarthak")
    }
    def allTopics(){
        render Topic.findAll()
    }

    def createTopic(){
        Map mp=[name: "hey",createdBy: User.first()]
       Topic t1= new Topic(mp)
    }
    def action2(){
        render("Hello brother!")
    }

}
