({
    fetchList : function(component, event, helper) {
        component.set('v.columns', [
            { label: 'Project Name', fieldName: 'Project_Name__c', type: 'text'},
            { label: 'Location', fieldName: 'Location__c', type: 'text'},
            { label: 'Mineral or Element for Extraction', fieldName: 'Mineral_or_Element_for_Extraction__c', type: 'text'},
            { label: 'Mining Project Start Date', fieldName: 'Mining_Project_Start_Date__c', type: 'date'},
        ]);
            
        helper.fetchList(component);
    },
    
    handleClick : function(component, event, helper){
        helper.handleClick(component);
    },
})