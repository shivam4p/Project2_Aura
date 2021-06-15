({
    fetchSpaceTravels: function(component, event, helper) {
        component.set('v.mycolumns', [
            { label: 'Space Travel Name', fieldName: 'Name', type: 'text' },
            { label: 'Ship', fieldName: 'Ship__c', type: 'text' },
            {
                label: 'Fuel Cost',
                fieldName: 'Fuel_Cost__c',
                type: 'number',
                sortable: true
            },
            {
                label: 'Food Storage',
                fieldName: 'Food_Storage__c',
                type: 'number',
                sortable: true
            },
            {
                label: 'Mining Project',
                fieldName: 'Mining_Name',
                type: 'text'
            },
            {
                label: 'Location',
                fieldName: 'Planet_Destination__c',
                type: 'picklist'
            },
        ]);
        helper.fetchSpaceTravels(component);
    },
    updateColumnSorting: function(cmp, event, helper) {
        var fieldName = event.getParam("fieldName");
        var sortDirection = event.getParam("sortDirection");
        cmp.set("v.sortedBy", fieldName);
        cmp.set("v.sortedDirection", sortDirection);
        helper.sortData(cmp, fieldName, sortDirection);
    },
});