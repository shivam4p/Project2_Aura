public class Update_Project_Mining_Subject {
    
    public static void UpdateProjectMiningSubject(List<Mining_Project_Id__c> newList){
        
         for(Mining_Project_Id__c miningProj: newList){
             
             switch on miningProj.Mineral_or_Element_for_Extraction__c
             {
                 //Validate Project Names with a particular pattern
                 when 'Lithium' {
                     if(!miningProj.Project_Name__c.startsWith('L'))
                     {
                         miningProj.addError('Project name should start with L');
                     }
                      
                 }
                 
                 when 'Hydrogen' {
                      if(!miningProj.Project_Name__c.startsWith('H'))
                     {
                         miningProj.addError('Project name should start with H');
                     }
                 }                 
              }             
         }
    }
}