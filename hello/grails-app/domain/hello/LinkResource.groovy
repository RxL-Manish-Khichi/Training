package hello


class LinkResource extends Resource{
    String url
    static belongsTo = [resource:Resource]



    static constraints = {
        url blank: false,nullable: false

    }
    static  mapping = {
        table 'LRESO'
        url column: 'URL'



    }
}

