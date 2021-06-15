@isTest
public class OperationsControllerTest {
    /*
    @AuraEnabled
    public static List<Operations__c> retrieveOperations() {
    List<Operations__c> oList = [SELECT Name, Mining_Project_Id__r.Project_Name__c
    FROM Operations__c];
    Security.stripInaccessible(System.AccessType.READABLE, oList);
    return oList;
    }
    */
    @isTest
    public static void retrieveOperationsTest() {
        
    }
    /*
    @AuraEnabled
    public static List<Operations__c> retrieveOperationInfo(String opName) {
    List<Operations__c> oList = [SELECT Name, Mining_Project_Id__r.Name,
    Site_Manager__r.Full_Name__c,
    Engineering_Machine__r.Machine_Name__c
    FROM Operations__c WHERE Name = :opName];
    Security.stripInaccessible(System.AccessType.READABLE, oList);
    return oList;
    }
    */
    @isTest
    public static void retrieveOperationInfoTest() {
        
    }
    /*
    @AuraEnabled
    public static List<Operations_Goal__c> retrieveOperationGoals(String opName) {
    List<Operations_Goal__c> ogList = [SELECT Name, Operation_Location__c, Operations__r.Name FROM Operations_Goal__c WHERE Operations__r.Name = :opName];
    Security.stripInaccessible(System.AccessType.READABLE, ogList);
    return ogList;
    }
    */
    @isTest
    public static void retrieveOperationGoalsTest() {
        
    }
    /*
    @AuraEnabled
    public static List<Operations_Goal__c> retrieveOpGoalInfo(String ogName) {
    List<Operations_Goal__c> ogList = [SELECT Name, Operation_Location__c,
    Number_of_Digging_Sites__c, Extraction_Technique__c,
    Cost_of_Operation__c, Stage__c
    FROM Operations_Goal__c WHERE Name = :ogName];
    Security.stripInaccessible(System.AccessType.READABLE, ogList);
    return ogList;
    }
    */
    @isTest
    public static void retrieveOpGoalInfoTest() {
        
    }
    /*
    @AuraEnabled
    public static void deleteOpGoal(String opGoalId) {
    Id ogId = opGoalId;
    Operations_Goal__c opGoal = [SELECT Id FROM Operations_Goal__c WHERE Id = :ogId];
    delete opGoal;
    }
    */
    @isTest
    public static void deleteOpGoalTest() {
        
    }
}