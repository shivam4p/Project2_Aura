public  with sharing class RiskLevelSearchController {
    
    // The User's input
    public String projectName { get; set; }

    public List<Mining_Project_Id__c> projectSearchResult { get; set; }

    public void projectQuery() {

        projectName = projectName.trim();

        projectSearchResult = [
            SELECT Name, Project_Name__c, Hazardous_Issues__c, Hazard_Count__c
              FROM Mining_Project_Id__c
             WHERE Project_Name__c = :projectName
             LIMIT 1
        ];
    }

}