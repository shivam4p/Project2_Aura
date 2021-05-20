public class newTaskHandler {
    //This Handler meets the SOQL, DML and Control FLow requirements requiremts
    public static void handlerJobRiskAcceptance(List<Site_Manager__c> newList){
        //This initialize machineList to an relationship query 
        List<Machine_and_Tools__c>machineList = [SELECT id FROM Machine_and_Tools__c WHERE Id IN(
            SELECT Machine_and_Tools__c FROM Mining_Project_Id__c WHERE Site_Manager__c IN :newList)];
        //init new task object
        List<Task> tList = new List<Task>();                
        for(Site_Manager__c s: newList){
            if(s.Agrees_with_the_dangers_of_the_project__c == true){
                List<Machine_and_Tools__c> ptList = new List<Machine_and_Tools__c>();
                for(Machine_and_Tools__c maList: machineList){
                    Task newTask = new Task();
                    newTask.OwnerId= UserInfo.getUserId();
                    newTask.Subject = 'Call';
                    newTask.Status = 'Not Started';
                    newTask.WhatId = maList.Id;
                    tList.add(newTask);
                }
            }
        }
        insert tList;
    }
}