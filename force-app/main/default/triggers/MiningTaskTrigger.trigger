trigger MiningTaskTrigger on Site_Manager__c (before insert) {
    if(Trigger.isAfter){
        If(Trigger.isUpdate){
            //As you can see I avoid logic in my triggers
            newTaskHandler.handlerJobRiskAcceptance(Trigger.New);
        }
    }
}