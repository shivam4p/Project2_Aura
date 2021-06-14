({
	doInIt : function(component, event, helper) {
        component.set('v.columns', [
            { label: 'Freight Name', fieldName: 'Name', type: 'text'},
            { label: 'Project Name', fieldName: 'ProjectName', type: 'text'},
            { label: 'Location', fieldName: 'Location', type: 'text'},
            { label: 'Outbound Departure Date', fieldName: 'Outbound_Departure_Date__c', type: 'date'},
            { label: 'Outbound Arrival Date', fieldName: 'Outbound_Arrival_Date__c', type: 'date'},
            { label: 'ITT', cellAttributes: { class: { fieldName: 'outboundStatus'}}},
            { label: 'Inbound Departure Date', fieldName: 'Inbound_Departure_Date__c', type: 'date'},
            { label: 'Inbound Arrived Date', fieldName: 'Inbound_Arrived_Date__c', type: 'date'},
            { label: 'IB Days', cellAttributes: { class: { fieldName: 'inboundStatus'}}},
        ]);
		helper.doInIt(component);
	},
            
	click : function(component, event, helper){
        helper.click(component);
    },
})