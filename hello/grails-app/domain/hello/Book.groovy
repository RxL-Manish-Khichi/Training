package hello

class Book {
    String title
    static belongsTo = [author:Author]

    static constraints = {
        title blank:false,nullable:false
    }
    static mapping = {
        table 'BOOK'
        title column: 'TTL'
    }
}
