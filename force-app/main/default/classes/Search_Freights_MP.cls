public with sharing class Seach_Freights_MP {
        /**
           *  This controller is used by the SearchCourses page.
           *  Users will select courses using the checkboxes and then click
           *  to see the upcoming course deliveries for those courses.
           */
      
          // Represents the main course list
               /** TODO #2: TODO #1 is located below (which should be done first). Complete the code for
                       *          the mp_List get property. Inside the If statement
                       *           -- Initialize the mp_List property as a List of FreightWrapper objects.
                       *           -- Create a for loop with an iterator of type Freight__c named course that iterates
                       *              over the returned value of a SOQL query that:
                       *              a.) Selects the Name, Certification__r.Name, Duration__c, Status__c fields
                       *              b.) From the Course sObject
                       *           -- Within the for loop, add to the mp_List property a new instance of FreightWrapper class 
                       *              which takes the iterator named course as input.
                       */
    public List<Mining_Project_Id__cWrapper> mp_List {
        get {
            if (mp_List == null) {
                mp_List = new List<Mining_Project_Id__cWrapper>();
                     for (Mining_Project_Id__c projects : [SELECT Project_Name_c, Location__c, Mineral_or_Element_for_Extraction__c, Mining_Project_Start_Date__c
                                                 FROM Mining_Project_Id__c]) {
                          mp_List.add(new Mining_Project_Id__cWrapper(projects));
                      }
                  }
                  // TODO #3: return the mp_List property
                  return mp_List;
              }
              set;
          }
              // Contains only the projects selected
              public Map<Id, Mining_Project_Id__cWrapper> selectedProjects {
                  get {
                      if (selectedProjects == null) {
                          selectedProjects = new Map<Id, Mining_Project_Id__cWrapper>();
                      }
                      return selectedProjects;
                  }
                  private set;
              }
      
          // Action that is triggered from the "See Upcoming Course Deliveries" button
          public PageReference listFreightMovement() {
              // Loop through all selected courses and print the name to the debug log
         /*      for (Mining_Project_Id__c cw : mp_List) {
                  if (cw.checked) {
                      System.debug('Course Selected: ' + cw.course.Name);
                  }
              }
                      return null; */
                      
              // First clear out any previously selected courses
              selectedProjects.clear();
      
              // Add the newly selected courses to the map
              for (Mining_Project_Id__cWrapper pl : mp_List) {
                  if (pl.checked) {
                      selectedProjects.put(pl.projects.Id, pl);
                  }
              }
                  /** TODO #1: Write an If-else statement that implements the following algorithm:
               *             -- If the size of the selectedProjects property is greater than 0
               *                -- return Page.ListCourseDeliveriesPage
               *             -- else:
               *                -- call the addMessage method of the ApexPages class passing in
               *                   a newly constructed instance of the ApexPages.message class.
               *                   The ApexPages.Message class constructor should be passed
               *                   two parameters:
               *                   -- the enumerated value ApexPages.Severity.ERROR
               *                   -- the String 'Please select at least one Course'
               *                   -- return null
               */
              if (selectedProjects.size() > 0) {
                  return Page.Display_MP_Freight_Info;
              } else {
                  ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Please select at least one Mining_Project'));
                  return null;
              }	
          }
              /** TODO #2: Declare a read-only property, whose type is a List of Course_Delivery__c
           *           sObjects named deliveries and have it include:
           *             -- an if statement that, if the deliveries property is null
           *                -- Assign the deliveries to a new instance of a list of Course_Delivery__c
           *                   sObjects that will accept as a parameter a SOQL query that:
           *                   -- Selects the Name, Course__r.Name, Instructor__r.Name,
           *                        Location__c, Start_Date__c, Status__c fields
           *                   -- From the Course_Delivery__c sObject
           *                   -- Where the value of the Freight__c field is in the KeySet for the selectedProjects
           *                      property and the Status__c is not equal to 'Cancelled' and the
           *                      Start_Date__c is greater to or equal to the keyword TODAY.
           *                   -- Order by Start_Date__c
           *                -- Return the deliveries property
           *             Be sure to include the set property and make it private.
           */
          public List<Mining_Project_Id__c> elementFreight {
              get {
                  if (elementFreight == null) {
                      elementFreight = new List<Freight__c>([
                                           SELECT Name, Mining_Project_Id__r.Project_Name__c, Mining_Project_Id__r.Location, Outbound_Departure_Date__c,Outbound_Arrival_Date__c, Inbound_Departure_Date__c,Inbound_Arrived_Date__c
                                             FROM Freight__c
                                            WHERE Freight__c IN :selectedProjects.keySet()]);
                                              //AND Status__c != 'Cancelled' and Start_Date__c >= TODAY
                                       //  ORDER BY Start_Date__c]);
                  }
                  return elementFreight;
              }
              private set;
          }
          
          /** TODO #3: Declare a method whose return type is PageReference named newSearch. Within the method:
           *             -- Declare a variable whose type is a PageReference named newPage and
           *                assign it a value of Page.SearchCoursesPage.
           *             -- Call the setRedirect method of the newPage property with a value of true
           *             -- return the newPage property
           */
          public PageReference newSearch() {
              PageReference newPage = Page.Search_MP_Freight_Info;
              newPage.setRedirect(true);
              return newPage;
          }
          /** TODO #1: Declare a wrapper class named Mining_Project_Id__c. Within the class:
           *             -- Declare a property whose type is Freight__c named course
           *             -- Declare a property whose type is a Boolean named checked.
           *                Both should use default getter and setter methods.
           *             -- Declare a public constructor named Mining_Project_Id__c that includes an input
           *                parameter whose type is Freight__c named c. Within the constructor:
           *                  -- Assign the course property to the value of the input parameter c
           *                  -- Assign the property checked the value of false.
           */
          public class Mining_Project_Id__cWrapper {
              public Freight__c projects {get; set;}
              public Boolean checked {get; set;}
      
              public Mining_Project_Id__cWrapper(Mining_Project_Id__c c) {
                projects = c;
                checked = false;
              }
    }
}
