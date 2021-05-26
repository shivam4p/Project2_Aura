@istest
private class RiskLevelSearchController_Test {

   
    @istest static void testSOQL(){

        Mining_Project_Id__c proj = new Mining_Project_Id__c();

        RiskLevelSearchController testCont = new RiskLevelSearchController();
        List<Mining_Project_Id__c> lstProject = testCont.projectQuery();

        System.assert(lstProject != null);
        
        
        
    }
}
