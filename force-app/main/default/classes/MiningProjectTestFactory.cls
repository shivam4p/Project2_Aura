@isTest
public class MiningProjectTestFactory {

    public static List<Mining_Project_Id__c> createProjects(Integer numProjects) {
        List<Mining_Project_Id__c> projs = new List<Mining_Project_Id__c>();
       

        Mining_Project_Id__c png = new Mining_Project_Id__c();
        
        for(Integer i=0;i<numProjects;i++) {
            png.Project_Name__c = 'Project_Name' + i;
            png.Location__c = 'Moon';
            png.Mineral_or_Element_for_Extraction__c = 'Iron';
            png.Mining_Project_Start_Date__c = Date.today() + i;
            projs.add(png);
        }
        insert projs;
        return projs;
    }
}