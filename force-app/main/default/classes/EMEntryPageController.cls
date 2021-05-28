public with sharing class EMEntryPageController {
    public Engineering_Machine__c EMObj{get;set;}
    String EMId{get;set;}
    public String message{get;set;}
    /**
      fetch current engineering machine
    **/
    public EMEntryPageController () { 
        message = '';
        // Fetching the Current engineering machine Id
        EMId = System.currentPageReference().getParameters().get('Id');
        if(EMId != NULL){
            EMObj = [SELECT  Id, Name, Machine_Name__c, available_status__c, model__c, Mining_Project_Id__c FROM Engineering_Machine__c WHERE id=:EMId];
        }
    }
    /**
      method for saving engineering machine record
    **/
     public PageReference savingEMRecord(){
      try{
         upsert EMObj;
      
         PageReference nextpage= new PageReference('/apex/engineeringmachine');
           return nextpage;
      }
      catch(Exception e){
            message='DataBase has error during saving...';
            ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.ERROR, message));
            return null;
        }
   }
     public PageReference CancelEMRecord(){
      try{   
         PageReference nextpage= new PageReference('/apex/engineeringmachine');
           return nextpage;
      }
      catch(Exception e){
            message='DataBase has error during saving...';
            ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.ERROR, message));
            return null;
        }
   }
    
}
