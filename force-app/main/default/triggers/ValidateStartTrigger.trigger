trigger ValidateStartTrigger on Mining_Project_Id__c (before delete) {
    if(Trigger.isBefore){
        if(Trigger.isDelete){
            //As you can see I avoid logic in my triggers
            ValidateStartHandler.ValidateStart(Trigger.old);
        }
    }
}