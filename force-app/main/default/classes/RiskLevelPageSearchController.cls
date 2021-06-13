public with sharing class RiskLevelPageSearchController {
 
 @AuraEnabled
  public static list<Mining_Project_Id__c> getMiningList(string searchKeyWord) {
  String searchKey = searchKeyWord + '%';
  List<Mining_Project_Id__c> miningListRecord = new list<Mining_Project_Id__c>();
  List <Mining_Project_Id__c> lstOfMining = [
             SELECT Name, Project_Name__c, Hazardous_Issues__c, Hazard_Count__c
             FROM Mining_Project_Id__c
             WHERE Project_Name__c LIKE : searchKeyword
             LIMIT 1];
 
  for (Mining_Project_Id__c min: lstOfMining) {
   miningListRecord.add(min);
  }
  return miningListRecord;
 }
}