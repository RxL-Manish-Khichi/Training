package hello


class DocumentResource extends Resource{
    String filePath

    static belongsTo= [resource:Resource]



    static constraints = {
        filePath blank: false,nullable: false
    }
    static  mapping = {
        table 'DRESO'
        filePath column: 'FPATH'


    }
}
