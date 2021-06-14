({
	handleClick : function(cmp, event) {          
        var cmpEvent  = cmp.getEvent("cmpReturnEvent");
        cmpEvent.fire();
    },
    
    handleCaptureEvent : function(cmp, event) {
        var message = event.getParam("MachineId");
        // set the handler attributes based on event data
        alert("Setting Machine ID" + message);
        cmp.set("v.MachineId", message);
        event.stopPropagation();
    }
})