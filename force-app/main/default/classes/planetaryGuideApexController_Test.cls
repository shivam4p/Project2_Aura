@isTest
public class planetaryGuideApexController_Test {
	

	@isTest
    private static void pGAC_MainTest() {
		List<Mining_Project_Id__c> projs = new List<Mining_Project_Id__c>();
       

        Mining_Project_Id__c png = new Mining_Project_Id__c();
        
            png.Project_Name__c = 'Project_Name' + 1 + ' ';
            png.Location__c = 'Moon';
            png.Mineral_or_Element_for_Extraction__c = 'Iron';
            png.Mining_Project_Start_Date__c = Date.today() + 1;
            projs.add(png);
        
        insert projs;
        
        planetaryGuideApexController.fetchLocationTotal();

		planetaryGuideApexController.fetchMiningProjects();
    }
    
}