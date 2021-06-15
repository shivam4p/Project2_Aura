public class DisplayListofSpaceTravels {
    @AuraEnabled
    public static List<Space_Travel__c> fetchSpaceRecords(){
        return new List<Space_Travel__c>([SELECT Name, Ship__c, Fuel_Cost__c,
                                          Food_Storage__c, Mining_Project_Id__r.Project_Name__c, 
                                          Planet_Destination__c FROM Space_Travel__c]);
    }
}