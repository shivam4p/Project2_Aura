({
    fetchList : function(component) {
        var action = component.get('c.displayList');
        action.setCallback(this, (function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set('v.data', response.getReturnValue());
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    },
    
    handleClick : function(component){
        var miningIds = component.find("miningTableIds").getSelectedRows();
        var listMiningIds = [];
        for( let i = 0; i<miningIds.length; i++){
            listMiningIds.push(miningIds[i].Id);
        }
        var freightEvent = component.getEvent("freightListEvent");
        
        freightEvent.setParams({"miningProjectIdList" : listMiningIds});
        
        freightEvent.fire();
    },
})