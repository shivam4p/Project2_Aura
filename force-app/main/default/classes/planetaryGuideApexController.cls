public with sharing class planetaryGuideApexController {
    
    @AuraEnabled
    public static Integer fetchLocationTotal()
    {
        List<Mining_Project_Id__c> results = [SELECT Location__c FROM Mining_Project_Id__c WHERE Location__c != Null];
        
        
        return results.size();
    }
    
    @AuraEnabled
    public static List<Integer> fetchMiningProjects() {
        List<Mining_Project_Id__c> results = [SELECT Location__c FROM Mining_Project_Id__c WHERE Location__c != Null ORDER BY Location__C DESC];
        List<Integer> returnList = new List<Integer>();
        Set<String> fieldBreakDown = new Set<String>();
        
        
        
        for(Mining_Project_Id__c result : results)
        {
            fieldBreakDown.add(result.Location__c);
        }
        
        for(String str : fieldBreakDown){
            System.debug('Currently against ' + str);
            Integer counter = 0;
            for(Mining_Project_Id__c result : results)
            {
                if(result.Location__c == str)
                {
                    counter++;
                }
            }
            returnList.add(counter);
        }
        
        return returnList;
    }
    
}