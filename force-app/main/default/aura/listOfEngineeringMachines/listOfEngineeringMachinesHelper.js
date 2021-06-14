({
    fetchAccHelper : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'View', type: 'button', initialWidth: 135, typeAttributes: { label: 'View Details', name: 'view_details', title: 'Click to View Details'}},
            {label: '', fieldName: 'Name', type: 'text'},
                {label: 'Machine Name', fieldName: 'Machine_Name__c', type: 'text'},
                {label: 'Status', fieldName: 'available_status__c', type: 'text', sortable: true},
                {label: 'Model', fieldName: 'model__c', type: 'text ', sortable: true},
            {label: 'Mining Project ID', fieldName: 'Mining_Project_Id__c', type: 'text'}
            ]);
        var action = component.get("c.fetchEMs");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.data", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },

	// Used to sort the 'Age' column
    sortBy: function(field, reverse, primer) {
        var key = primer
            ? function(x) {
                  return primer(x[field]);
              }
            : function(x) {
                  return x[field];
              };

        return function(a, b) {
            a = key(a);
            b = key(b);
            return reverse * ((a > b) - (b > a));
        };
    },

    handleSort: function(cmp, event) {
        var sortedBy = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');

        var cloneData = cmp.get('v.data');
        cloneData.sort((this.sortBy(sortedBy, sortDirection === 'asc' ? 1 : -1)));
        
        cmp.set('v.data', cloneData);
        cmp.set('v.sortDirection', sortDirection);
        cmp.set('v.sortedBy', sortedBy);
    },

	showRowDetails : function(row, cmp, event) {
        var cmpEvent  = cmp.getEvent("cmpEvent");
        cmpEvent.setParam("MachineId", row.Id);
        
        
        cmpEvent.fire();
    }
})