package hello

import grails.gorm.transactions.Transactional

@Transactional
class ToppostService {

    def serviceMethod() {

    }
    List<Resource> topPost(){
        List<ResourceRating> l = ResourceRating.createCriteria().list{
            projections{
                avg("score");
            }
            groupProperty("resource");
        }
        Map resourceRating= [:]
        println "post--->>>"+l
        l.each{
            resourceRating.put(it[1],it[0]);
        }
        println "maptopPost---->>>> "+resourceRating
        resourceRating=resourceRating.sort{it.value};
        println "aftersort------->>>>" + resourceRating
        List<Resource> toppost = [];
        resourceRating.each{
            toppost.push(it.key);
        }
        List<Resource>revtoppost = toppost.reverse();
        if(revtoppost.size()>=5)
        {
            revtoppost=revtoppost.subList(0,5)
        }
        println "toppost----->>> "+revtoppost;
        return revtoppost;
    }
   /* List<Resource> topPost(){
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
    } */
}
