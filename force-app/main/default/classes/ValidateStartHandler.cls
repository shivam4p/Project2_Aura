public with sharing class ValidateStartHandler {
    public static void ValidateStart(List<Mining_Project_Id__c> startDateList){
        for(Mining_Project_Id__c s: startDateList){
            if(s.Mining_Project_Start_Date__c != NULL){
                //s.addError('You cannot delete this project');
            }
        }
    }      
}