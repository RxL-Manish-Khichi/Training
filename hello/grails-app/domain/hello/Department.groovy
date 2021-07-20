package hello

class Department {
    String departmentName
    String departmentId
    String location
    static hasMany = [employees:Employee]


    static constraints = {
        location nullable: true
        departmentName blank: false,nullable: false
        departmentId unique: true

    }

    static mapping = {
        table 'DEPT'
        departmentName column: 'DNAME'
        departmentId column: 'DID'
        location column: 'LOC'

    }
}

