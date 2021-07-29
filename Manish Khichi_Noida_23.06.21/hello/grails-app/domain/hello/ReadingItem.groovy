package hello


class ReadingItem{
    //  Resource resource
    //  User user
    boolean isRead
    static belongsTo=[user:User,resource:Resource]




    static constraints = {
        isRead blank:false
        /* email blank: false,nullable: false
        username unique: true
        firstname blank: false,nullable: false
        lastname blank: true,nullable: false
        password unique: true */
    }
    static  mapping = {
        table 'RITEM'
      //  Resource column: 'RSOUR'
       // User column: 'USE'
        isRead column: 'ISR'


    }
}


