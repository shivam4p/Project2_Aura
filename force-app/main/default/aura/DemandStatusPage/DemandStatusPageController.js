({
    doinit : function(component, event, helper) {
        component.set('v.mycolumns', [
            {label: 'Mining Project Id', fieldName: 'Name', type: 'text', cellAttributes: {alignment: 'left'}},
            {label: 'Project Name', fieldName: 'Project_Name__c', type: 'text'},
            {label: 'Type', fieldName: 'Type__c', type: 'text'},
            {label: 'Mineral or Element for Extraction', fieldName: 'Mineral_or_Element_for_Extraction__c', type: 'text'},
            {label: 'Location', fieldName: 'Location__c', type: 'text'},
            {label: 'Demand Status', fieldName: 'Demand_Status__c', type: 'text'},
            
        ]);
        helper.allProjects(component);
        helper.demandStatus(component);
    },
    
    onControllerFieldChange : function(component, event, helper){
        var pickselected = component.find("PicklistId").get("v.value");
        console.log('pickselected--->>> ' + pickselected);
        var action = component.get("c.getProjects");
        action.setParams({demandStatus : pickselected});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var allValues = response.getReturnValue();
                console.log('allValues--->>> ' + JSON.stringify(allValues));
                component.set("v.mydata", allValues);
            }
        });
        $A.enqueueAction(action);
    }
})