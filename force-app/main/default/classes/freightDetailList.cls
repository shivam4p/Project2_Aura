public class freightDetailList {
    @AuraEnabled
    public static list<Freight__c> displayList() {
        List<Freight__c> freightDetails =[SELECT Id, Name, Freight_Status__c, Freight_log__c, Number_of_Containers__c, 
                                          Container_Capacity__c, Total_Freight_Load__c, Mining_Project_Id__r.Project_Name__c 
                                          FROM Freight__c];
        return freightDetails;
    }
}