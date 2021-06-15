({
    //Initialization function
    //-----------------------------------------------------------
	init : function(cmp) {
        //Set columns for datatable in component
        cmp.set('v.mycolumns', [
            { 
                label: 'First Name', 
                fieldName: 'First_Name__c', 
                type: 'text'},
            {
                label: 'Last Name',
                fieldName: 'Last_Name__c',
                type: 'text'
            },
            {
                label: 'Email',
                fieldName: 'Email__c',
                type: 'email'
            },
            {
                label: 'Emergency Contact',
                fieldName: 'Emergency_Contact__c',
                type: 'text'
            },
            {
                label: 'Agrees with Dangers of Project',
                fieldName: 'Agrees_with_the_dangers_of_the_project__c',
                type: 'checkbox'
            }
        ]);
        //Get initial data
        // Create the action
        var action = cmp.get('c.retrieveManagers');
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            //Set attribute mydata to hold returned data values if response is successful
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                cmp.set('v.mydata', response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
	},
    //-----------------------------------------------------------
    //Function for when create button is clicked
    //-----------------------------------------------------------
    createClick : function(cmp, event) {
        //Set Boolean attribute, creatingManager, to true
        cmp.set('v.creatingManager', true);
    },
    //-----------------------------------------------------------
    //Function for when cancel button is clicked
    //-----------------------------------------------------------
    cancelCreateClick : function(cmp, event) {
        //Set Boolean attribute, creatingManager, to false
        cmp.set('v.creatingManager', false);
    },
    //-----------------------------------------------------------
    //Function for when submit button is clicked
    //-----------------------------------------------------------
    submitClick : function(cmp, event) {
        this.cancelCreateClick(cmp,event);
        this.init(cmp);
    },
})