trigger LeadTrigger on Lead (before insert) {
	
    if(Trigger.isInsert && Trigger.isAfter){
        LeadTriggerHandler.preventContactCreation(Trigger.New);
    }
}