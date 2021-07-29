package hello

import org.hibernate.mapping.Map

class ViewtestController {

    def index() {
        render(view: "index")
    }
    def check1(){
        render(view: "check1")

    }

    def check2(){
        Map map=[exp:true]
        render (view:"index",model:map)
    }
    def check3()
    {
        render("check 3 text")
    }
    def check4()
    {
        println(">>>>>>>>paraam....."+params)
        render("${params.name } "+ "${params.age}")

    }
}

