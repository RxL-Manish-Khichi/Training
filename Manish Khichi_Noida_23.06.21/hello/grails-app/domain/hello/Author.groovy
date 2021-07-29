package hello



class Author {
    String name
    static hasMany = [books:Book]

    static constraints = {
        name blank:false,nullable:false
    }
    static mapping = {
        table 'AUTH'
        name column: 'NAME'

    }
}
