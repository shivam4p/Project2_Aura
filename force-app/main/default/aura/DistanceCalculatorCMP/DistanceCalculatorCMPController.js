({
    fetchDist: function(component, event, helper) {
        helper.fetchDistHelper(component, event, helper);
    },
    
    onChange: function(cmp, event, helper) {
        var selectedPicklistValue = component.find("planetPicklist").get("v.value");
        alert("selectedPicklistValue ==>" + selectedPicklistValue);
    }
});