@isTest
private class Operations_CC_Test {
    @isTest static void OperationsList_Test() {
        Operations__c newOp = new Operations__c();
        Operations_goal__c newOpGoal = new Operations_goal__c();
        Operations_CC controller = new Operations_CC();
        controller.operationId = newOp.Id;
        // controller.goalId = newOpGoal.Id;
        controller.goal = new Operations_Goal__c();
        controller.editMode = false;
        // controller.newGoal =


        controller.toggleEditMode();
        controller.showOperation();
        PageReference pageRef = Page.saveNew;
        Test.setCurrentPage(pageRef);
        controller.saveNew();
        controller.save();
        controller.displayDetail();
        controller.deleteGoal();
        controller.cancelCreate();
    }
}
