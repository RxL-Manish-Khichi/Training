package hello


import Enums.VisibilityEnum

class Topic{
    String topicname
    // User createdBy
    Date dateCreated
    Date lastUpdated
    //  enum visibility //public,private
    VisibilityEnum visibility
    static belongsTo=[createdBy:User]
    static hasMany = [resources:Resource,subscribers:Subscription]



    static constraints = {
        topicname blank: false,nullable: false

    }
    static  mapping = {
        table 'TOP'
        name column: 'TNAME'
        createdBy column: 'CREAT'
        dateCreated column: 'DCREATE'
        lastUpdated column: 'LUPDATE'
        //visibility column: 'VISIBLE'


    }
}