({
	doInIt : function(component) {
        var action = component.get('c.displayFreightList');
        action.setParams({"listOfIds" : component.get("v.listOfMiningIds")});
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var data = response.getReturnValue();
                for( let i=0; i< data.length; i++ ){
                    let outboundCheck = data[i].Outboune_Travel_Time__c;
                if( outboundCheck<25){
                    data[i].outboundStatus = "onTime"; //"onTime" is located in STYLE
                }else{
                    data[i].outboundStatus = "delay"; //"delay" is located in STYLE
                }
                }
                for( let i=0; i< data.length; i++ ){
                    let inboundCheck = data[i].Inbound_Travel_Time__c;
                if( inboundCheck<25){
                    data[i].inboundStatus = "onTime"; //"onTime" is located in STYLE
                }else{
                    data[i].inboundStatus = "delay"; //"delay" is located in STYLE
                }
                }
                for( let i=0; i< data.length; i++ ){
                    if(data[i].Mining_Project_Id__c == null){
                        data[i].ProjectName = "No Project";
                        data[i].Location = "No Location";
                    } else{
                        data[i].ProjectName = data[i].Mining_Project_Id__r.Project_Name__c ;
                        data[i].Location = data[i].Mining_Project_Id__r.Location__c ;
                    }
                }
                component.set('v.tripDetails', data);
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        });
        $A.enqueueAction(action);
    },
    
    click : function(component){
        var changeBackEvent = component.getEvent("goBackEvent");
        
        changeBackEvent.setParams();
        
        changeBackEvent.fire();
    },
})