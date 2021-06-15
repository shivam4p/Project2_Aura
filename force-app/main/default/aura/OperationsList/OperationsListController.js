({
    init: function (cmp, event, helper) {
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
        // Create the action
        var action = cmp.get('c.retrieveOperations');
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                for (var iterator of response.getReturnValue()) {
                    iterator.Project_Name = iterator.Mining_Project_Id__r.Project_Name__c
                }
                cmp.set('v.mydata', response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    itemSelected : function (cmp, event, helper) {
        var selectedRow = event.getParam('selectedRows');
        alert("You selected: " + selectedRow[0].Name);
    }
})