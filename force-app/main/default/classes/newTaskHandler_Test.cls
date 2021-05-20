@IsTest//(seeAllData=True)
public class newTaskHandler_Test {
    static testMethod void testmethod1()
    {
        List<Site_Manager__c> lstSiteManagers = new List<Site_Manager__c>();
        Test.startTest();
        Machine_and_Tools__c machineTool = new Machine_and_Tools__c();
        //machineTool.Id = 'a005e000001yC4IAAU';
        insert machineTool;
        
        Site_Manager__c siteManager = new Site_Manager__c();
        //siteManager.id  ='a025e000000yW2jAAE';
        siteManager.First_Name__c = 'Test First Name';
        siteManager.Last_Name__c = 'Test Last Name';
         
        insert siteManager;
        
        siteManager.Agrees_with_the_dangers_of_the_project__c = true;
        lstSiteManagers.add(siteManager);
        
        Mining_Project_Id__c miningProject = new Mining_Project_Id__c();
        miningProject.Machine_and_Tools__c = machineTool.id;
        miningProject.Site_Manager__c = siteManager.id;
        miningProject.Mining_Project_Start_Date__c = Date.newInstance(2021, 05, 11);
        insert miningProject;

        newTaskHandler.handlerJobRiskAcceptance(lstSiteManagers);
         Test.stopTest();
    }        
}