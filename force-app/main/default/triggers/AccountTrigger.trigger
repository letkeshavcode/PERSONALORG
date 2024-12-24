trigger AccountTrigger on Account (before insert,after insert,after update) {
    if(Trigger.isInsert && Trigger.isBefore){
       // AccountTriggerHandler.updateDesc(Trigger.new);
        AccountTriggerHandler.duplicateName(Trigger.new);
    }
    
    if(Trigger.isInsert && trigger.isAfter){
        AccountTriggerHandler.createOpportunity(Trigger.new);
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        AccountTriggerHandler.updateContact(Trigger.OldMap,Trigger.NewMap,Trigger.New);
    }
    
    
    
}