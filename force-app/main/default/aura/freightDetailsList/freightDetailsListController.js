({
	getList : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Project Name', fieldName: 'ProjectName', type: 'text'},
            {label: 'Frieght Status', fieldName: 'Freight_Status__c', type: 'text'},
            {label: 'Freight Log', fieldName: 'Freight_log__c', type: 'text'},
            {label: 'Number of Containers', fieldName: 'Number_of_Containers__c', type: 'number'},
            {label: 'Container Capacity', fieldName: 'Container_Capacity__c', type: 'number'},
            {label: 'Total Freight Load', fieldName: 'Total_Freight_Load__c', type: 'number'}, 
        ]);
        
		helper.getList(component);
	}
})