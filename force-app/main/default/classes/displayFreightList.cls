public class displayFreightList {
    @AuraEnabled
    public static list<Mining_Project_Id__c> displayList() {
        List<Mining_Project_Id__c> freightList =[SELECT Id, Project_Name__c, Location__c, 
                                                 Mineral_or_Element_for_Extraction__c, Mining_Project_Start_Date__c 
                                                 FROM Mining_Project_Id__c];
        return freightList;
    }
    
    @AuraEnabled
    public static list<Freight__c> displayFreightList(List<Id> listOfIds){
        List <Freight__c> tripDetails =[SELECT Id, Name, Outbound_Departure_Date__c, Outbound_Arrival_Date__c, Outboune_Travel_Time__c,
                              Inbound_Departure_Date__c, Inbound_Arrived_Date__c, Inbound_Travel_Time__c,
                              Mining_Project_Id__r.Project_Name__c, Mining_Project_Id__r.Location__c
                              FROM Freight__c WHERE Mining_Project_Id__c IN :listOfIds];
        return tripDetails;
    }
}