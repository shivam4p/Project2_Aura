@isTest
private class DisplayListofSpaceTravelsTest {
    @isTest
    private static void spaceTravelTest(){
        List<Space_Travel__c> testRun = new List<Space_Travel__c>();
        for(Integer i=0; i<10; i++){
            Space_Travel__c testTravel = new Space_Travel__c();
            testTravel.Name = 'John Trip ' + i;
            testTravel.Ship__c = 'Ship Bean' + i;
            testTravel.Fuel_Cost__c= 652150;
            testTravel.Food_Storage__c= 10000;
            testTravel.Planet_Destination__c= 'Titan';
            testRun.add(testTravel);
        }    
        DisplayListofSpaceTravels.fetchSpaceRecords();
    }
}