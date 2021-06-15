({
    fetchSpaceTravels: function(component) {
        var action = component.get('c.fetchSpaceRecords');
        action.setCallback(this, (function(response) {
            var state = response.getState();
            if (state === "SUCCESS"){
                var holder = response.getReturnValue();
            	for(let i = 0; i<holder.length; i++){
                    if(holder[i].Mining_Project_Id__c==null){
                        holder[i].Mining_Name="Waiting for Project";
                    }else{
                        holder[i].Mining_Name=holder[i].Mining_Project_Id__r.Project_Name__c;
                    }
            	}
                component.set('v.mytable', holder);
            }
        }));
        $A.enqueueAction(action);
    },
    sortData: function(cmp, fieldName, sortDirection) {
        var data = cmp.get('v.mycolumns');
        var reverse = sortDirection !== "asc";
        data.sort(this.sortBy(fieldName, reverse));
        cmp.set('v.mycolumns', data);
    },
    sortBy: function(field, reverse, primer) {
        var key = primer
        ? function(x) {
            return primer(x[field]);
        }
        : function(x) {
            return x[field];
        };
        reverse = !reverse ? 1 : -1;
        return function(a, b) {
            return (a = key(a)), (b = key(b)), reverse * ((a > b) - (b > a));
        };
    }
});