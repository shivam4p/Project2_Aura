public with sharing class EMController {
    private String sortOrder = 'Mining_Project_Id__c';
    public List<Engineering_Machine__c> getEMs() {
        List<Engineering_Machine__c> results = Database.query(
            'SELECT Id, Name, Machine_Name__c, available_status__c, model__c, Mining_Project_Id__c ' +
            'FROM Engineering_Machine__c ' +
            'ORDER BY ' + sortOrder + ' ASC ' +
            'LIMIT 10'
        );
        return results;
    }
    public void sortByModel() {
        this.sortOrder = 'model__c';
    }
    public void sortByStatus() {
        this.sortOrder = 'available_status__c';
    }
}