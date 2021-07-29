package hello

import linksharing.Enums.SeriousnessEnum

class Subscription{
    //  Topic topic
    //  User user
   // enum seriousness  //serious,very serious,casual
    SeriousnessEnum serious
    Date dateCreated
    static belongsTo=[topic:Topic,user:User]




    static constraints = {
        // name blank: false,nullable: false
        //  User unique: true
    }
    static  mapping = {
        table 'SUBS'
       // name column: 'TNAME'
        //createdBy column: 'CREAT'
        dateCreated column: 'DCREATE'

       // visibility column: 'VISIBLE'


    }
}
