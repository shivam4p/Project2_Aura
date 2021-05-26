public with sharing class Search_Freights_MP {
    
    public class MiningProjectIdcWrapper {
        
        public Mining_Project_Id__c projects {get; set;}
        public Boolean checked {get; set;}
            
        public MiningProjectIdcWrapper(Mining_Project_Id__c mp) {
            projects = mp;
            checked = false;
        }
    }
    /*
    public class FreightWrapper{
        public Freight__c outTdays {get;set;}
        public Freight__c inTdays {get;set;}
        
        public FreightWrapper(Freight__c item){
            
        }
        
        public FreightWrapper(Freight__c otd , Freight__c itd){
            outTdays = otd;
            inTdays = itd;
        }
    }
    
    public List<FreightWrapper> first{
        get{
            if(first == null){
                first = new List<FreightWrapper>();
                for (Freight__c otd : [SELECT Outboune_Travel_Time__c FROM Freight__c ]){
                    first.add(new FreightWrapper(otd));
                }
            }
            return first;
        }
        set;
    }
      */
    public List<MiningProjectIdcWrapper> mp_List {
        get {
            if (mp_List == null) {
                mp_List = new List<MiningProjectIdcWrapper>();
                for (Mining_Project_Id__c projects : [SELECT Project_Name__c, Location__c, Mineral_or_Element_for_Extraction__c,
                                                      Mining_Project_Start_Date__c FROM Mining_Project_Id__c]) {
                                                          mp_List.add(new MiningProjectIdcWrapper(projects));
                                                      }
            }
            // TODO #3: return the mp_List property
            return mp_List;
        }
        set;
    }
    // Contains only the projects selected
    public Map<Id, MiningProjectIdcWrapper> selectedProjects {
        get {
            if (selectedProjects == null) {
                selectedProjects = new Map<Id, MiningProjectIdcWrapper>();
            }
            return selectedProjects;
        }
        private set;
    }
    
    // Action that is triggered from the "See Upcoming Course Deliveries" button
    public PageReference listFreightMovement() {
        
        // First clear out any previously selected courses
        selectedProjects.clear();
        
        // Add the newly selected courses to the map
        for (MiningProjectIdcWrapper pl : mp_List) {
            if (pl.checked) {
                selectedProjects.put(pl.projects.Id, pl);
            }
        }     
        if (selectedProjects.size() > 0) {
            return Page.Display_MP_Freight_Info;
        } else {
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Please select at least one Mining_Project'));
            return null;
        }	
    }    
    public List<Freight__c> trips {
        get {
            if (trips == null) {
                trips = new List<Freight__c>([
                    SELECT Name, Mining_Project_Id__r.Project_Name__c, Mining_Project_Id__r.Location__c, Outbound_Departure_Date__c,
                    Outbound_Arrival_Date__c, Outboune_Travel_Time__c,Inbound_Departure_Date__c,Inbound_Arrived_Date__c, Inbound_Travel_Time__c
                    FROM Freight__c
                    WHERE Mining_Project_Id__c IN :selectedProjects.keySet()]);
                //AND Status__c != 'Cancelled' and Start_Date__c >= TODAY
                //  ORDER BY Start_Date__c]);
            }
            return trips;
        }
        private set;
    }

    public PageReference newSearch() {
        PageReference newPage = Page.Search_MP_Freight_Info;
        newPage.setRedirect(true);
        return newPage;
    }    

}