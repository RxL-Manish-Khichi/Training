package hello

import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionService {

    def subscriptions(String name) {
        User user = User.findByUsername(name)
        List subList = Subscription.createCriteria().list(max:5){
            eq("user.id",user.id)
        }
        return subList

    }
}
