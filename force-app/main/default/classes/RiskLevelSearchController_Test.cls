@istest
private class RiskLevelSearchController_Test {

    @istest static void testRiskSOQL(){

        test.startTest();

        List<Mining_Project_Id__c> lstProj = new List<Mining_Project_Id__c>();

        for (Integer count = 0; count < 50; count++) {
            lstProj.add(new Mining_Project_Id__c (Project_Name__c = 'HailMary '+ count));
        }

        RiskLevelSearchController testCont = new RiskLevelSearchController();

        List<String> stringList = new List<String>{'Corrosive Environment'};
        testCont.selectedPickValues = stringList;

        testCont.projectName = 'Leda I';
        testCont.projectSearchResult = [SELECT Name, Project_Name__c, Hazardous_Issues__c, Hazard_Count__c
        FROM Mining_Project_Id__c
       WHERE Project_Name__c = :testCont.projectName
       LIMIT 1];
      
        testCont.projectQuery();

    }

}
