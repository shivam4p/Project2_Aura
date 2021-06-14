({
	getList : function(component) {
      var action = component.get('c.displayList');
        action.setCallback(this, (function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var data = response.getReturnValue();
                for( let i=0; i< data.length; i++ ){
                    if(data[i].Mining_Project_Id__c == null){
                        data[i].ProjectName = "No Project";
                    } else{
                        data[i].ProjectName = data[i].Mining_Project_Id__r.Project_Name__c ;
                    }
                }
                component.set('v.details', data);
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    },
})