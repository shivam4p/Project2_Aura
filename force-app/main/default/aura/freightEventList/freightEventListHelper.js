({
	handleClick : function(component, event) {
		var listOfIds = event.getParam("miningProjectIdList");
        component.set("v.miningIds", listOfIds);
        component.set("v.ShowFreightTrip", false);
	},
    
    click : function(component, event){
    	component.set("v.ShowFreightTrip", true);
    },
    
    
})