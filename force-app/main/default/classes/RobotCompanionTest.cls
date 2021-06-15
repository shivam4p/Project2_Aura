@isTest
private class RobotCompanionTest {
    @isTest
    private static void RobotTest(){
        List<Robot__c> testRobot = new List<Robot__c>();
        for(Integer i=0; i<10; i++){
            Robot__c testCompanion = new Robot__c();
            testCompanion.Name = 'Bob ' + i;
            testRobot.add(testCompanion);
        }    
        RobotCompanionController.getRobot();
    }
}