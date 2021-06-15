public class RobotCompanionController {
	@AuraEnabled
    public static List<Robot__c> getRobot(){
		return [SELECT Name, Space_Travel__r.Name FROM Robot__c];        
    }
}