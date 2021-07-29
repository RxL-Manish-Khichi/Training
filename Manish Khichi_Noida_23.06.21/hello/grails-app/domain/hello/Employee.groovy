package hello

class Employee {
    String empName
    int empNumber
    String location
    static hasMany = [departments:Department]



    static constraints = {
        location nullable: true
        empName blank: false,nullable: false
        empNumber unique: true
    }
    static  mapping = {
        table 'EMP'
        empName column: 'ENAME'
        empNumber column: 'ENUM'
        location column: 'ELOC'
    }
}









