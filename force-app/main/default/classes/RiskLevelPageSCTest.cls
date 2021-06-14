@isTest
private class RiskLevelPageSCTest {
 
    @testSetup
    private static void loadTestData() {
        List<Mining_Project_Id__c> testMining = new List<Mining_Project_Id__c>();
        for(Integer i=0;i<4;i++) {
            testMining.add(new Mining_Project_Id__c(Project_Name__c = 'projectTest' + i, Hazardous_Issues__c = 'Corrosive Environment'));
        }
        insert testMining;    
    }
    
    @isTest
    private static void testGetMiningList() {
        test.startTest();
        List<Mining_Project_Id__c> mining = RiskLevelPageSearchController.getMiningList('projectTest1');
        test.stopTest();
           
    }
    
    @isTest
    private static void testGetMiningListFail() {
        test.startTest();
        List<Mining_Project_Id__c> mining = RiskLevelPageSearchController.getMiningList('projectTest50');
        test.stopTest();
           
    }
}