package hello

class Person {
    String pname
    String age
    String dob
    String address
    String mobileno


    static constraints = {
        pname nullable:false
        age nullable:false
        dob nullable:true
        address nullable: false
        mobileno nullable:true
    }
    static mapping = {
        table 'PRS'
        pname column: "PN",type: "text"
        age column:"AG"
        dob column:"DATEB"
        address column: "ADRS"
        mobileno column: "MNO"
        id name: "pname"


    }
}
