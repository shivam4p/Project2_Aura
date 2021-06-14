@isTest
private class freightApexTest {
    
    @isTest 
    private static void testDisplayFreightListMiningPositve(){
        List<Mining_Project_Id__c> lstTesting = new List<Mining_Project_Id__c>();
		Mining_Project_Id__c m;
        for(Integer i=0;i<=20;i++){
            m = new Mining_Project_Id__c(Project_Name__c='Testing'+string.valueof(i));
            lstTesting.add(m);
        }
        insert lstTesting;
        List<Mining_Project_Id__c> listOfMiningProjects = displayFreightList.displayList();
        System.assert( listOfMiningProjects != null); 

    }
    
    @isTest
    private static void testDisplayFreightListMiningNegative(){
        List<Mining_Project_Id__c> listOfMiningProjects = displayFreightList.displayList();
        System.assert( listOfMiningProjects.isEmpty(), true); 
    }
    
    @isTest
    private static void testDisplayFreightListFreightPositve(){
        List<Mining_Project_Id__c> lstMiningRef = new List<Mining_Project_Id__c>();
        Mining_Project_Id__c m;
        for(Integer i=0;i<=20;i++){
            m = new Mining_Project_Id__c(Project_Name__c='Testing'+string.valueof(i));
            lstMiningRef.add(m);
        }
        insert lstMiningRef;
        List<Id> refId = new List<Id>();
        for(Mining_Project_Id__c mTest : lstMiningRef ){
            refId.add(mTest.Id);
        }
        List<Freight__c> lstTesting = new List<Freight__c>();
        Freight__c f;
        for(Integer i=0;i<=20;i++){
            for(Integer j=0; j<lstMiningRef.size(); j++){
            f = new Freight__c(Mining_Project_Id__c= lstMiningRef[j].Id);
            lstTesting.add(f);
            }
        }
        insert lstTesting;
        List<Freight__c> listOfFreightTrip = displayFreightList.displayFreightList(refId);
        System.assert( listOfFreightTrip.isEmpty() != null);
        
        
    }
    
    @isTest
    private static void testDisplayFreightListFreightNegative(){
        List<Mining_Project_Id__c> lstMiningRef = new List<Mining_Project_Id__c>();
        insert lstMiningRef;
        List<Id> refId = new List<Id>();
        for(Mining_Project_Id__c m : lstMiningRef ){
            refId.add(m.Id);
        }
        List<Freight__c> listOfFreightTrips = displayFreightList.displayFreightList(refId);
        System.assert( listOfFreightTrips.isEmpty(), true);
    }
    
    @isTest 
    static void testFreightDetailListPositive(){
        List<Mining_Project_Id__c> lstMiningRef = new List<Mining_Project_Id__c>();
        Mining_Project_Id__c m;
        for(Integer i=0;i<=20;i++){
            m = new Mining_Project_Id__c(Project_Name__c='Testing'+string.valueof(i));
            lstMiningRef.add(m);
        }
        insert lstMiningRef;
        List<Freight__c> lstTesting = new List<Freight__c>();
        Freight__c f;
        for(Integer i=0;i<=20;i++){
            for(Integer j=0; j<lstMiningRef.size(); j++){
            f = new Freight__c(Mining_Project_Id__c= lstMiningRef[j].Id);
            lstTesting.add(f);
            }
        }
        insert lstTesting;
        List<Freight__c> listOfFreightDetail = freightDetailList.displayList();
        System.assert( listOfFreightDetail != null);
    }

    @isTest static void testFreightDetailListNegative(){
        List<Freight__c> listOfFreightDetail = freightDetailList.displayList();
        System.assert( listOfFreightDetail.isEmpty(), true);
    }

}