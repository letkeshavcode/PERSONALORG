public class CaseTriggerHandler {
    
    public static void changeOwnerOfCase(List<Case> insertedCases){
   		
        List<Case> case_to_update = new List<Case>();
        
        for(Case eachCase : insertedCases){
            if(eachCase.status == 'priced-(Initial)' || eachCase.status =='priced-(Re-priced)' || eachCase.status =='priced-(File loaded)'){
                eachCase.OwnerId = eachCase.CreatedById;
                case_to_update.add(eachCase);
            }
        }
      
        if(case_to_update.size()>0){
            update case_to_update;
        }
        
    }
    
}