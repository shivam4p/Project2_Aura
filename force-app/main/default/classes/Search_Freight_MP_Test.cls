@isTest
public with sharing class Search_Freight_MP_Test {
    @testSetup
    private static void loadTestData() {
        
         List<Mining_Project_Id__c> projects = MiningProjectTestFactory.createProjects(15);    
    }
    
    @isTest
    private static void testSearchProjects() {

        // TODO #2: Set the current page
        PageReference Search_MP_Freight_Info = Page.Search_MP_Freight_Info;
        Test.setCurrentPage(Search_MP_Freight_Info);
        
        // Do the test
        Test.startTest();

        // TODO #3: Instantiate the controller
        Search_Freights_MP mp = new Search_Freights_MP();
        
        // TODO #4: Get the list of CourseWrapper elements
        List<Search_Freights_MP.MiningProjectIdcWrapper> MiningProjectIdcWrapper = mp.mp_List;
        // TODO #5: Modify the list by checking all the elements
        for (Search_Freights_MP.MiningProjectIdcWrapper wrapper : MiningProjectIdcWrapper) {
            wrapper.checked = true;
            }

        // TODO #6: Set modified list back to controller
        mp.mp_List = MiningProjectIdcWrapper;

        // TODO #7: Navigate to ListResultsPage by callng the listDeliveries method - capture the resulting url
        String url = mp.listFreightMovement().getURL();        
        Test.stopTest();
        
        // Verify the results
        
             // TODO #8: Check that all the elements have the boolean "checked" set to true
             List<Search_Freights_MP.MiningProjectIdcWrapper> mpWrappersModified = mp.mp_List;
             Integer count = 0;
             for (Search_Freights_MP.MiningProjectIdcWrapper wrapper : mpWrappersModified) {
                 if ( !wrapper.checked) count++;
             }
             System.assertEquals(0, count, 'ERROR: Found at least one MiningProjectIdcWrapper element not checked');
             
             // TODO #9: Check the correct navigation to ListCourseDeliveriesPage
             System.assertEquals(Page.Display_MP_Freight_Info.getURL(), url, 'ERROR: Expected to navigate to /apex/Display_MP_Freight_Info');

    }
}