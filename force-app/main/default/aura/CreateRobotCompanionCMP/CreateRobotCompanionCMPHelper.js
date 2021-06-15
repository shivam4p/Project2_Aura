({
	reverse : function(component){
        var reversepage = component.getEvent("ReverseDisplayEvent");
        reversepage.setParams();
        reversepage.fire();
    },
})