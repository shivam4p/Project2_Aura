public class Operations_CC {
    public Id operationId {get; set;}
    public Id goalId {get; set;}
    public Operations_Goal__c goal {get; set;}
    public Boolean editMode {get; set;}
    public Operations_Goal__c newGoal {get; set;}

    public Operations_CC() {
        editMode = false;
    }
    public void toggleEditMode() {
        if (newGoal == null || newGoal.Id != null) {
            newGoal = new Operations_Goal__c();
        }
        editMode = !editMode;
    }

    public List<Operations__c> operationList {
        get {
            if (operationList == null) {
                operationList = new List<Operations__c>();
                for (Operations__c operation : [SELECT Name, Mining_Project_Id__r.Project_Name__c FROM Operations__c]) {
                    operationList.add(operation);
                }
            }
            return operationList;
        }
        set;
    }

    public Operations__c operation {
        get {
            if (operation == null) {
                operation = new Operations__c();
                operation = [SELECT Name, Manager_Name__c, Mining_Project_Id__c, Machine_and_Tools__c
                FROM Operations__c WHERE Id = :operationId LIMIT 1];
            }
            return operation;
        }
        set;
    }

    public Operations_Goal__c operationGoal {
        get {
            if (operationGoal == null) {
                operationGoal = new Operations_Goal__c();
                String theId = (String)operationId;
                String whereClause = 'WHERE Operations__c = \'' + theId + '\' LIMIT 1';
                List<String> fieldsToSanitize = new List<String>{'Name', 'Cost_of_Operation__c', 'Extraction_Techique__c', 'Number_of_Digging_Sites__c', 'Operation_Location__c' , 'Stage__c'};
                operationGoal = sanitizeQuery(fieldsToSanitize, 'Operations_Goal__c', whereClause)[0];
            }
            return operationGoal;
        }
        set;
    }

    public List<Operations_Goal__c> goalList {
        get {
            // if (goalList == null) {
                goalList = new List<Operations_Goal__c>();
                for(Operations_Goal__c og : [SELECT Name, Operation_Location__c, Number_of_Digging_Sites__c,Extraction_Techique__c,Cost_of_Operation__c,Stage__c
                FROM Operations_Goal__c WHERE Operations__c = :operationId]) {
                    goalList.add(og);
                }
                System.debug(goalList.size());
            // }
            return goalList;
        }
        set;
    }


    public PageReference saveNew() {
        try {
            newGoal.Operations__c = operationId;
            insert(newGoal);
            editMode = false;
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.CONFIRM,
                                'Successfully created new goal!'));
            goalId = null;
            return null;
        } catch(System.DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,
                                'Uh oh, something went wrong..'));
            return null;
        }
    }

    public PageReference save() {
        try {
            upsert(goal);
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.CONFIRM,
                                'Successfully edited the goal!'));
        } catch(System.DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, 
                                'Uh oh, something went wrong..'));
            return null;
        }
        return null;
    }
    public PageReference cancelCreate() {
        editMode = false;
        return null;
    }

    public PageReference displayDetail() {
        goal = [SELECT Name, Operation_Location__c, Number_of_Digging_Sites__c,Extraction_Techique__c,Cost_of_Operation__c,Stage__c
        FROM Operations_Goal__c WHERE Id = :goalId LIMIT 1];
        System.debug(goal);
        goalId = goal.Id;
        return null;
    }

    public PageReference deleteGoal() {
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.CONFIRM,
                            'Successfully deleted the goal!'));
        try {
            Operations_Goal__c og = new Operations_Goal__c(Id = goalId);
            delete og;
            editMode = true;
            goalId = null;
        } catch(Exception e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,
                                'Uh oh, something went wrong..'));
            return null;
        }
        return null;
    }

    public PageReference showOperation() {
        PageReference pr = Page.SingleOperationPage;
        System.debug(operationId);
        pr.getParameters().put('operationId', operationId);
        return pr;
        
    }
    
    public static List<Operations_Goal__c> sanitizeQuery(List<String> strList, String sObjectName, String whereClauseStr) {
        String queryString = 'SELECT ';
        List<String> fieldsToCheck = new List<String>();
        for (String str : strList) {
            fieldsToCheck.add(str);
        }
        
        Map<String, List<String>> entitiesToCheck = new Map<String, List<String>>();
        entitiesToCheck.put(sObjectName, fieldsToCheck);
        
        Set<String> accessibleFields = checkAccessibility(entitiesToCheck);
        
        queryString += accessibleFields.toString().substring(1, accessibleFields.toString().length() - 1) + ' FROM ' + sObjectName + ' ' + whereClauseStr;
        return Database.query(queryString);

    }

    public static Set<String> checkAccessibility(Map<String, List<String>> entitiesToCheck) {
        List<String> objectNames = new List<String>();
        for(String objectName : entitiesToCheck.keySet()) {
            objectNames.add(objectName);
        }
        
        List<Schema.DescribeSObjectResult> describedObjects = Schema.describeSObjects(objectNames);
        
        Set<String> accessibleFields = new Set<String>();
        
        for(Schema.DescribeSObjectResult dsor : describedObjects) {
            if(dsor.isAccessible()) {
                for(String field : entitiesToCheck.get(dsor.getName())) {
                    if(dsor.fields.getMap().get(field).getDescribe().isAccessible()) {
                        accessibleFields.add(field);
                    }
                }
            }
        }
        return accessibleFields;
    } 
}