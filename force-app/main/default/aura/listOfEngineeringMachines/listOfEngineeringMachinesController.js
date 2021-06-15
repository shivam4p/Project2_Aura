({
    fetchAcc : function(component, event, helper) {
        helper.fetchAccHelper(component, event, helper);
    },

	handleSort: function(cmp, event, helper) {
        helper.handleSort(cmp, event);
    },
	
	handleRowAction: function (cmp, event, helper) {
		//var action = event.getParam('action');
        var row = event.getParam('row');
        helper.showRowDetails(row, cmp, event);
        /*if( action == 'view_details'){
          helper.showRowDetails(row);
        }*/

    }
    
    
})