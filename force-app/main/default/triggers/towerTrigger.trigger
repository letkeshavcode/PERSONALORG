trigger towerTrigger on Tower__c (before insert,after insert) {
	
    if(Trigger.isInsert && Trigger.isAfter){
        TowerTriggerHelper.createFloors(Trigger.new);
    }
    
    
}