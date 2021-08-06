package hello

import grails.gorm.transactions.Transactional

@Transactional
class ToppostService {

    def serviceMethod() {

    }
    List<Resource> topPost(){
        Map<Integer,Integer> mp =[:]
        Resource.list().each {
            if(ResourceRating.findByResource(it)) {
                Integer l = ResourceRating.createCriteria().get {
                    projections {
                        avg("score");
                    }
                    like("resource", it)
                }
                mp[it.id] = l
            }
        }
        mp = mp.sort {it.value}
        List<Resource> m = []
        Set<Integer> s = mp.keySet()
        for(int i=0;i<s.size();i++)
        {
            m.add(Resource.findById(s[i]))
        }
       m = m.reverse()
        if(m.size()>5)
        {
            m=m.subList(0,5)
        }
        return m
    }
}
