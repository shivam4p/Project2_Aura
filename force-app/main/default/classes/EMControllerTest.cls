@isTest
public class EMControllerTest {
    @isTest
    static void rungetEMTest(){
        EMController controller=new EMController();
        Engineering_Machine__c em1=new Engineering_Machine__c(Machine_Name__c='test machine1', model__c='Bmodel',available_status__c='using in project');
        insert em1;
        Engineering_Machine__c em2=new Engineering_Machine__c(Machine_Name__c='test machine2', model__c='Amodel',available_status__c='in repair');
        insert em2;
         Engineering_Machine__c em3=new Engineering_Machine__c(Machine_Name__c='test machine3', model__c='Cmodel',available_status__c='available');
        insert em3;
        list<Engineering_Machine__c> em_list=controller.getEMs();
        System.assertEquals(3, em_list.size());
        controller.sortByModel();
        em_list=controller.getEMs();
        System.assertEquals('Amodel', em_list[0].model__c);
        controller.sortByStatus();
        em_list=controller.getEMs();
        System.assertEquals('available', em_list[0].available_status__c);
    }

}
