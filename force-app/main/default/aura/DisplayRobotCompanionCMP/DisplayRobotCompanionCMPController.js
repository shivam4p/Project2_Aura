({
	display : function(component, event, helper) {
		component.set('v.mycolumns', [
            {label:'Name', fieldName:'Name', type:'text'},
            {label:'Ship', fieldName:'Ship_Name', type:'text'}
        ]);
        helper.display(component);
	},
    click : function(component, event, helper) {
        helper.click(component);
    }
})