({
    handleComponentEvent : function(cmp, event) {
        var message = event.getParam("MachineId");
        // set the handler attributes based on event data
        cmp.set("v.MachineId", message);
        cmp.set("v.ShowMachineList", false);
        
        var cmpDownEvent  = cmp.getEvent("cmpTransferMachine");
        cmpDownEvent.setParam("MachineId", message);
        cmpDownEvent.fire();
    },
    
    handleReturnComponentEvent : function(cmp, event) {
        cmp.set("v.ShowMachineList", true);
    }
})