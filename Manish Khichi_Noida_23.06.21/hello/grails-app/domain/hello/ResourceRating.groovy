package hello

class ResourceRating {


   // Resource resource
   // User user
    int score
    static belongsTo=[user:User,resource:Resource]




    static constraints = {
        score blank:false
        /* email blank: false,nullable: false
        username unique: true
        firstname blank: false,nullable: false
        lastname blank: true,nullable: false
        password unique: true */
    }
    static  mapping = {
        table 'RRATE'
       //  Resource column: 'RSOUR1'
       //  User column: 'USE1'
        score column: 'SCR'


    }
}