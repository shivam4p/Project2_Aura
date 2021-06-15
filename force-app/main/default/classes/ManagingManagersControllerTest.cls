@isTest
public class ManagingManagersControllerTest {
    /*
    @AuraEnabled
    public static List<Site_Manager__c> retrieveManagers() {
        List<Site_Manager__c> smList = [SELECT First_Name__c, Last_Name__c, Email__c, 
                                        Emergency_Contact__c, Agrees_with_the_dangers_of_the_project__c 
                                        FROM Site_Manager__c];
        Security.stripInaccessible(System.AccessType.READABLE, smList);
        return smList;
    }
	*/
    
    @isTest
    private static void retrieveManagersTest() {
        
    }
}