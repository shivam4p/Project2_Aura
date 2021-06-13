({
    allProjects : function(component) {
        var action = component.get("c.getAllProjects");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var allValues = response.getReturnValue();
                console.log('allValues -- >> ' + allValues);
                component.set("v.mydata", allValues);
            }
        });
        $A.enqueueAction(action);
    },
    
	demandStatus : function(component) {
		var action = component.get("c.getDemandStatus");
        var percent = component.find("PicklistId");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var allValues = response.getReturnValue();
                console.log('allValues -- >> ' + allValues);
                component.set("v.pickName", allValues);
            }
        });
        $A.enqueueAction(action);
	}
})