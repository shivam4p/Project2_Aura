@IsTest//(seeAllData=True)
public class ValidateStartDate_Test {
  static testMethod void testRecordWithDate()
    {
        List<Mining_Project_Id__c> lstProjectIds = new List<Mining_Project_Id__c>();
        Mining_Project_Id__c miningProjct = new Mining_Project_Id__c();
               
        miningProjct.Project_Name__c = 'Test Project';
        miningProjct.Mining_Project_Start_Date__c =  Date.newInstance(2021, 05, 10);
        lstProjectIds.add(miningProjct);
        
        miningProjct = new Mining_Project_Id__c();        
        miningProjct.Project_Name__c = 'Test Project2';
        miningProjct.Mining_Project_Start_Date__c =  Date.newInstance(2021, 04, 20);
        lstProjectIds.add(miningProjct);       
        
        insert lstProjectIds;
        
        Test.startTest(); 
        delete lstProjectIds;
        Test.stopTest();
        
       // ValidateStartHandler.ValidateStart(lstProjectIds);
        
        
        
    } 
}