package hello

class User{
    String email
    String username
    String password
    String firstname
    String lastname
    String confirmpassword
    String photo
    boolean admin
    boolean active
    Date dateCreated
    Date lastUpdated
    static hasMany = [topics:Topic,resources:Resource,subscriptions:Subscription,readingitems:ReadingItem]



    static constraints = {
       email(unique: true, email: true)
        username(unique: true, nullable: false)
       firstname blank: false
      //  password blank: false
      photo nullable: true
        password(validator:{val,obj->
            if(val.equals(obj.firstname)||val.equals(obj.lastname)){return false}
        })



    }
    static  mapping = {
        table 'USR'
        email column: 'EMAIL'
        username column: 'UNAME'
        password column: 'PWORD'
        firstname column: 'FNAME'
        lastname column: 'LNAME'
        confirmpassword column:'CPWD'
        dateCreated column: 'DCREATE'
        lastUpdated column: 'LUPDATE'
       // photo sqlType:"mediumblob"


    }

}

