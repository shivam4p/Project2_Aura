({
    //Initialization function
    //-----------------------------------------------------------
	init : function(cmp) {
        //Set Column Labels and Types
        cmp.set('v.mycolumns', [
            { 
                label: 'Operations', 
                fieldName: 'Name', 
                type: 'text'
            },
            {
                label: 'Project Name',
                fieldName: 'Project_Name',
                type: 'text'
            }
        ]);
        
        //Have action to retrieve data from apex controller
        // Create the action
        var action = cmp.get('c.retrieveOperations');
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                for (var iterator of response.getReturnValue()) {
                    iterator.Project_Name = iterator.Mining_Project_Id__r.Project_Name__c;
                }
                cmp.set('v.mydata', response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
        
        //Set values for attributes
        cmp.set('v.showOpDetail', false);
        cmp.set('v.showCreateGoal', false);
        cmp.set('v.showGoalDetail', false);
    },
    //-----------------------------------------------------------
    //Function for when Operation is selected
    //-----------------------------------------------------------
    itemSelected : function (cmp, event) {
        //Get selected Operation
        var selectedRow = event.getParam('selectedRows');
        cmp.set('v.showOpDetail', true);
        
        //Have action to get details for selected operation
        // Create the action
        var action = cmp.get('c.retrieveOperationInfo');
        action.setParams({ opName : selectedRow[0].Name });
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                for (var iterator of response.getReturnValue()) {
                    cmp.set('v.OpName', iterator.Name);
                    if (iterator.Mining_Project_Id__r.Name != null) {
                        iterator.Project_Name = iterator.Mining_Project_Id__r.Name;
                        cmp.set('v.ProjectName', iterator.Project_Name);
                    }
                    if (iterator.Site_Manager__r.Full_Name__c != null) {
                        iterator.Manager_Name = iterator.Site_Manager__r.Full_Name__c;
                        cmp.set('v.ManagerName', iterator.Manager_Name);
                    }
                    if (iterator.Engineering_Machine__r.Machine_Name__c != null) {
                        iterator.Machine_Name = iterator.Engineering_Machine__r.Machine_Name__c;
                        cmp.set('v.MachineName', iterator.Machine_Name);
                    }
                }
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
        
        //Set Operation Goal Table Columns
        cmp.set('v.opGoalsColumns', [
            { 
                label: 'Operation Goal', 
                fieldName: 'Name', 
                type: 'text'
            },
            {
                label: 'Operation Location',
                fieldName: 'Operation_Location__c',
                type: 'text'
            }
        ]);
        
        //Have action to retrieve Operation Goals
        // Create the action
        var opGoalAction = cmp.get('c.retrieveOperationGoals');
        opGoalAction.setParams({ opName : selectedRow[0].Name });
        // Add callback behavior for when response is received
        opGoalAction.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                cmp.set('v.opGoals', response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(opGoalAction);
        
    },
    //-----------------------------------------------------------
    //Function for when Operation Goal is selected
    //-----------------------------------------------------------
    goalSelected : function (cmp, event) {
        //Get selected Operation Goal
        var selectedGoal = event.getParam('selectedRows');
        cmp.set('v.showGoalDetail', true);
        
        //Have action to retrieve Operation Goal Information
        // Create the action
        var action = cmp.get('c.retrieveOpGoalInfo');
        action.setParams({ ogName : selectedGoal[0].Name });
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                console.log('Response :' + response.getReturnValue());
                if (response.getReturnValue()[0].Id != null) {
                    cmp.set('v.GoalDetail', response.getReturnValue()[0].Id);
                }
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
        
    },
    //-----------------------------------------------------------
    //Function for when update is submitted
    //-----------------------------------------------------------
    updateClick : function (cmp, event) {
        cmp.set('v.showGoalDetail', false);
        this.init(cmp);
    },
    //-----------------------------------------------------------
    //Function for when cancel update button is clicked
    //-----------------------------------------------------------
    cancelUpdateClick : function (cmp, event) {
        cmp.set('v.showGoalDetail', false);
    },
    //-----------------------------------------------------------
    //Function for when delete button is pressed
    //-----------------------------------------------------------
    deleteClick : function (cmp, event) {
        //Have action call method to delete Operation Goal
        // Create the action
        var action = cmp.get('c.deleteOpGoal');
        action.setParams({ opGoalId : cmp.get('v.GoalDetail') });
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                console.log('Response :' + response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
        
        cmp.set('v.showGoalDetail', false);
        this.init(cmp);
    },
    //-----------------------------------------------------------
    //Function for when Create Goal button is pressed
    //-----------------------------------------------------------
    createGoalClick : function (cmp, event) {
        cmp.set('v.showCreateGoal', true);
    },
    //-----------------------------------------------------------
    //Function for when cancel button from create Operation Goal is pressed
    //-----------------------------------------------------------
    cancelCreateClick : function (cmp, event) {
        cmp.set('v.showCreateGoal', false);
    },
    //-----------------------------------------------------------
    //Function for when Save button from create Operation Goal is pressed
    //-----------------------------------------------------------
    submitCreateClick : function (cmp, event) {
        cmp.set('v.showCreateGoal', false);
        
        this.init(cmp);
    }
})