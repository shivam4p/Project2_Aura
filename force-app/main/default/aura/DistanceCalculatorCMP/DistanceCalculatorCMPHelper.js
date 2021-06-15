({
    fetchDistHelper: function(component, event, helper) {
        var action = component.get("c.fetchDistance");
        action.setParams({});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.distList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
});