package hello


import grails.gorm.transactions.Transactional

@Transactional
class UserlistService {

    def listMethod() {
        List userl= User.list()
        return userl

    }
}
