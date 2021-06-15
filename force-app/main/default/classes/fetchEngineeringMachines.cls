public with sharing class fetchEngineeringMachines {   
    
    @AuraEnabled
    public static List<Engineering_Machine__c> fetchEMs(Integer sortType) {
        String sortOrder = 'Mining_Project_Id__c';
		switch on sortType {
            when 1 {
                sortOrder = 'model__c';
            }	
            when 2 {
                sortOrder = 'available_status__c';
            }
            when else {	
                sortOrder = 'Mining_Project_Id__c';
            }
        }
                
        List<Engineering_Machine__c> results = Database.query(
            'SELECT Id, Name, Machine_Name__c, available_status__c, model__c, Mining_Project_Id__c,  Mining_Project_Id__r.name ' +
            'FROM Engineering_Machine__c ' +
            'ORDER BY ' + sortOrder + ' ASC ' +
            'LIMIT 10'
        );
        return results;
    }
    
    
}