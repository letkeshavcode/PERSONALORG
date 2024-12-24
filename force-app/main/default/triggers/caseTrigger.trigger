trigger caseTrigger on Case (before insert) {
	
    if(Trigger.isInsert && Trigger.isAfter){
        CaseTriggerHandler.changeOwnerOfCase(Trigger.new);
    }
    
}