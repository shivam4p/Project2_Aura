trigger UpdateProjectNameTrigger on Mining_Project_Id__c (before update) {
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            Update_Project_Mining_Subject.UpdateProjectMiningSubject(Trigger.New);
        }
    }
}