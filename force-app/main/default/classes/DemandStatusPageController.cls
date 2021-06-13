public class DemandStatusPageController {
    
    @AuraEnabled
    public static List<String> getDemandStatus(){
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Mining_Project_Id__c.Demand_Status__c.getDescribe();
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
            options.add(p.getLabel());
        }
        return options;
    }
    
    @AuraEnabled
    public static List<Mining_Project_Id__c> getProjects(String demandStatus) {
        List<Mining_Project_Id__c> projects = [SELECT Name, Project_Name__c, Mineral_or_Element_for_Extraction__c,Location__c,Type__c, Demand_Status__c FROM Mining_Project_Id__c WHERE Demand_Status__c=:demandStatus];
        return projects;
    }
    
    @AuraEnabled
    public static List<Mining_Project_Id__c> getAllProjects() {
        List<Mining_Project_Id__c> allProjects = [SELECT Name, Project_Name__c, Mineral_or_Element_for_Extraction__c,Location__c,Type__c, Demand_Status__c FROM Mining_Project_Id__c];
        return allProjects;
    }
}