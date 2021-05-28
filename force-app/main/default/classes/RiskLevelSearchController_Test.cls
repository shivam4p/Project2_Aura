@istest
private class RiskLevelSearchController_Test {

    @istest static void initVariables(){
        Test.startTest();
        RiskLevelSearchController testCont = new RiskLevelSearchController();

        List<String> stringList = new List<String>{'Corrosive Environment'};
        String stringTest = 'Leda I';

        testCont.projectName = stringTest;
        testCont.selectedPickValues = stringList;
        Test.stopTest();
    }
    @istest static void testSOQL(){
        Test.startTest();

        RiskLevelSearchController testCont = new RiskLevelSearchController();
        List<Mining_Project_Id__c> lstProj = new List<Mining_Project_Id__c>();

        testCont.projectSearchResult = lstProj;
        testCont.projectQuery();
 
        test.stopTest();


    }

}
