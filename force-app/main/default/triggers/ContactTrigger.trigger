trigger ContactTrigger on Contact (after insert,after delete,before insert,after update) {
    if(Trigger.isInsert && Trigger.isAfter){
       // ContactTriggerHandler.showContact(Trigger.New);
        ContactTriggerHandler.sendEmail(Trigger.New);
        
              
        
    }
    if(Trigger.isUpdate && Trigger.isAfter){
      	List<Account> toUpdate = new List<Account>();
        for(Contact con : Trigger.New){
            if(Trigger.oldMap.get(con.Id).AccountId != Trigger.newMap.get(con.Id).AccountId){
                Account ac = [SELECT Id,Account.Email_id__c FROM Account WHERE Id =: con.AccountId ];
                ac.Email_id__c = 'Manoj@appcino.com';
                toUpdate.add(ac);
            }
        }        
        
        if(toUpdate.size()>0){
            update toUpdate;
        }
    }
    
    if(Trigger.isDelete && Trigger.isAfter ){
      //  ContactTriggerHandler.DeleteCon(Trigger.Old);
        // ContactTriggerHandler.showContact(Trigger.Old);
      
    }
    
    if(Trigger.isBefore && Trigger.isInsert){
      //   ContactTriggerHandler.setAccountName(Trigger.New);
    }
    
    
    
        
}