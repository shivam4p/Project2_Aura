({
	display : function(component) {
		var action = component.get('c.getRobot');
        action.setCallback(this, (function(response) {
            var state = response.getState();
            if(state === "SUCCESS"){
                var data = response.getReturnValue();
                for(let i = 0; i<data.length; i++){
                    if(data[i].Space_Travel__c==null){
                        data[i].Ship_Name="No Ship";
                    }else
                        data[i].Ship_Name=data[i].Space_Travel__r.Name;
                }
                console.log(response.getReturnValue());
                component.set('v.mydata', response.getReturnValue());
            }else
                console.log("ERROR");
        }));
        $A.enqueueAction(action);                           
	},
    click : function(component){
        var changepage = component.getEvent("PageDisplayEvent");
        changepage.setParams();
        changepage.fire();
    },
})