@IsTest//(seeAllData=True)
public class Update_Project_Mining_Subject_Test {    
    
    static testmethod void testmethod1()
    {
        List<Mining_Project_Id__c> lstMiningProj = new List<Mining_Project_Id__c>();
               
        Mining_Project_Id__c minProj = new Mining_Project_Id__c();
        
        minProj.Mineral_or_Element_for_Extraction__c = 'Lithium';
        minProj.Project_Name__c = 'L: New ProjectName';
        minProj.Mining_Project_Start_Date__c = Date.today();
        lstMiningProj.add(minProj);
        
       // minProj = new Mining_Project_Id__c();
       // minProj.Mineral_or_Element_for_Extraction__c = 'Hydrogen';
       // minProj.Project_Name__c = ':H Not correct Name';
      //  minProj.Mining_Project_Start_Date__c = Date.today();
      //  lstMiningProj.add(minProj);
        
        //Update_Project_Mining_Subject.UpdateProjectMiningSubject(lstMiningProj);
        insert lstMiningProj;
        
        Test.startTest();      
        //
        lstMiningProj[0].Project_Name__c = 'L: newName';
        System.debug(lstMiningProj[0]);
        update lstMiningProj;
        //id testId = lstMiningProj[0];        
        Test.stopTest();
        //List<String> testString = [SELECT Project_Name__c from Mining_Project_Id__c WHERE Project_Name__c = 'newName'];
        
        //System.assertEquals('newName', testString[0]);
    }

}