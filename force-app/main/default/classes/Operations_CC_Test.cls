@isTest
private class Operations_CC_Test {
    @isTest static void OperationsList_Test() {
        Operations_CC controller = new Operations_CC();
        List<Operations__c> testList = new List<Operations__c>();
        for (Integer i = 0; i < 10; i++) {
            Operations__c op = new Operations__c();
            op.Mining_Project_Id__c = 'a035e00000086eCAAQ';
            // System.debug(op);
            testList.add(op);
        }
        insert testList;
        PageReference pageRef = Page.OperationsPage;
        Test.setCurrentPage(pageRef);
        controller.operationList = null;
        System.assertEquals(10, controller.operationList.size());
    }
    @isTest static void operation_Test() {
        Operations_CC controller = new Operations_CC();
        controller.operationId = 'a055e000000593KAAQ';
        
        Operations__c o = new Operations__c();
        o.Mining_Project_Id__c = 'a035e00000086eCAAQ';
        insert o;
        controller.operationId = o.Id;

        PageReference pageRef = Page.SingleOperationPage;
        Test.setCurrentPage(pageRef);
        controller.operation = null;
        
        Operations__c o2 = [SELECT Name, Mining_Project_Id__c, Machine_and_Tools__c FROM Operations__c LIMIT 1];
        System.assertEquals(o2, controller.operation);
    }

    @isTest static void operationGoal_Test() {
        Operations__c o = new Operations__c();
        o.Mining_Project_Id__c = 'a035e00000086eCAAQ';
        insert o;
        Operations_goal__c og = new Operations_goal__c();
        og.Operations__c = o.Id;
        insert og;

        Operations_CC controller = new Operations_CC();
        controller.operationId= o.id;
        
        PageReference pageRef = Page.SingleOperationPage;
        Test.setCurrentPage(pageRef);
        controller.operationGoal = null;
        Operations_goal__c og2 = [SELECT Id, Name FROM Operations_goal__c LIMIT 1];
        System.assertEquals(og2, controller.operationGoal);
    }

    @isTest static void goalList_Test() {
        Operations__c o = new Operations__c();
        o.Mining_Project_Id__c = 'a035e00000086eCAAQ';
        insert o;
        List<Operations_goal__c> ogList = new List<Operations_goal__c>();
        for (Integer i = 0; i < 10; i++) {
            Operations_goal__c og = new Operations_goal__c();
            og.Operations__c = o.Id;
            ogList.add(og);
        }
        insert ogList;

        Operations_CC controller = new Operations_CC();
        controller.operationId= o.id;
        
        PageReference pageRef = Page.SingleOperationPage;
        Test.setCurrentPage(pageRef);
        
        List<Operations_goal__c> ogList2 = [SELECT Id, Name FROM Operations_goal__c];
        System.assertEquals(ogList2, controller.goalList);
    }
    @isTest static void saveNew_Test() {
        Operations__c o = new Operations__c();
        o.Mining_Project_Id__c = 'a035e00000086eCAAQ';
        insert o;

        Operations_CC controller = new Operations_CC();
        controller.operationId = o.id;
        controller.newGoal = new Operations_goal__c();
        controller.saveNew();

        PageReference pageRef = Page.SingleOperationPage;
        Test.setCurrentPage(pageRef);
        
        // Operations_goal__c og = [SELECT Id, Name FROM Operations_goal__c LIMIT 1];
        // System.assertEquals(og.Operations__c, o.id);

        controller.operationId = null;
        controller.saveNew();
    }

    @isTest static void save_Test() {
        Operations__c o = new Operations__c();
        o.Mining_Project_Id__c = 'a035e00000086eCAAQ';
        insert o;

        PageReference pageRef = Page.SingleOperationPage;
        Test.setCurrentPage(pageRef);

        Operations_CC controller = new Operations_CC();
        controller.operationId = o.id;
        controller.goal = new Operations_goal__c();
        controller.save();

        // Operations_goal__c g = [SELECT Id FROM Operations_goal__c LIMIT 1];
        controller.goal = null;
        controller.save();

    }

    @isTest static void cancelCreate_Test() {
        Operations_CC controller = new Operations_CC();
        controller.cancelCreate();
    }

    @isTest static void displayDetail_Test() {
        Operations_CC controller = new Operations_CC();
        Operations_Goal__c og = new Operations_Goal__c();
        insert og;
        controller.goalId = og.Id;
        controller.displayDetail();
    }

    @isTest static void deleteGoal_Test() {
        Operations_CC controller = new Operations_CC();
        Operations_Goal__c og = new Operations_Goal__c();
        insert og;
        controller.goalId = og.Id;
        controller.deleteGoal();

        controller.goalId = null;
        controller.deleteGoal();

    }

    @isTest static void showOperation() {
        Operations_CC controller = new Operations_CC();
        Operations__c o = new Operations__c();
        o.Mining_Project_Id__c = 'a035e00000086eCAAQ';
        insert o;
        controller.operationId = o.Id;
        controller.showOperation();
    }

    @isTest static void toggleEditMode_Test() {
        Operations_CC controller = new Operations_CC();
        controller.toggleEditMode();
    }
}
