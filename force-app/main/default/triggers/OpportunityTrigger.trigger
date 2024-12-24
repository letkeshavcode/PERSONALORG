trigger OpportunityTrigger on Opportunity (before insert,after update) {
		
    if(Trigger.isInsert && Trigger.isBefore){
    // OpportunityTriggerHandler.fillWonReason(Trigger.New);
      
     
    }
     
    if(Trigger.isAfter && Trigger.isUpdate){
        OpportunityTriggerHandler.sendPdf(Trigger.New);
    }
        
    
}