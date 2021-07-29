package hello

import com.fasterxml.jackson.annotation.JsonAutoDetect
import linksharing.Enums.VisibilityEnum

class Topic{
    String name
    //  User createdBy
    Date dateCreated
    Date lastUpdated
    //  enum visibility //public,private
    VisibilityEnum visibility
    static belongsTo=[createdBy:User]
    static hasMany = [resources:Resource]



    static constraints = {
        name blank: false,nullable: false

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