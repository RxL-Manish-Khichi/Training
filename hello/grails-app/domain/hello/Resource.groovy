package hello


class Resource{
    String description
    //  User createdBy
    // Topic topic
    Date dateCreated
    Date lastUpdated
    static belongsTo=[createdBy:User,topic:Topic]




    static constraints = {
        description blank: false,nullable: false

    }
    static  mapping = {
        table 'RESO'
        description column: 'DESCP'
       // createdBy column: 'CREATB'
       // topic column: 'TOPC'
        dateCreated column: 'DRCR'
        lastUpdated column: 'LRCR'


    }
}

class LinkResource extends Resource{
    String url

}

class DocumentResource extends Resource{
    String filePath
}
