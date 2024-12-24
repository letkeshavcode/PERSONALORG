public class AccountTriggerHandler {
    
    public static void updateContact(Map<Id,Account> triggerOldMap,Map<Id,Account> triggerNewMap,List<Account> AccountList){
        Set<Id> AccountId = new Set<Id>();
        for(Account obj: triggerNewMap.values()){
            if(triggerOldMap.get(obj.Id).Name!=triggerNewMap.get(obj.Id).Name){
                AccountId.add(obj.Id);
            }
        }
        List<Contact>  contactsToUpdate =[SELECT Id,Account.Name,LastName FROM Contact WHERE AccountId in:AccountId LIMIT 50000];
        for(Contact obj : contactsToUpdate){
            obj.LastName= obj.Account.Name;
        }
        
        if(contactsToUpdate.size()>0){
            update contactsToUpdate;
        }
        
        
    }
    
    public static void updateDesc(List<Account> AccList){
        
        for(Account acc: AccList){
            if(acc.Industry!=NULL && acc.Industry=='Media'){
                acc.Rating='Hot';
            }
        }
        
        
        
    }
    
    public static void createOpportunity(List<Account> aList){
        List<Opportunity> OpportunityToBeCreated = new List<Opportunity>();
        
        if(!aList.isEmpty()){
            for(Account acc : aList){
                Opportunity opp=new Opportunity();
                opp.Name=acc.Name;
                opp.AccountId= acc.Id;
                opp.StageName='Prospecting';
                opp.CloseDate=System.today();
                OpportunityToBeCreated.add(opp);
                
            }
            
        }
        
        if(!OpportunityToBeCreated.isEmpty()){
            insert OpportunityToBeCreated;
        }
        
        
    }
    
    public static void duplicateName(List<Account> Acclist){
 		
        List<Account> existingAccounts = [SELECT Id,Name FROM Account LIMIT 50000];
        Map<String,Boolean> mapOfExistingAccounts = new Map<String,Boolean>();
        
        for(Account acc :existingAccounts){
            mapOfExistingAccounts.put(acc.name,true);
        }
		
        for(Account acc: AccList){
            if(mapOfExistingAccounts.containsKey(acc.Name)){
                acc.Name.addError('Account already exists with that name');
            }
        }        
        
        
        
        
    }
    
}