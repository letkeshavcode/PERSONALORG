public class ContactTriggerHandler {
    public static void setAccountName(List<Contact> ContactsToBeCreated){
        
        List<Account> listAccToInsert = new List<Account>();
        Map<String,Account> mapOfExistingAccount = new Map<String,Account>();
        
        Map<String,String>  mapNewAccountToInsertToId= new Map<String,String>();
        
        for(Account objAcc : [SELECT Id,Name FROM Account LIMIT 5000]){
            mapOfExistingAccount.put(objAcc.Name,objAcc);
        }
        
        for(Contact conObj : ContactsToBeCreated){
            if(conObj.Company__c!=NULL && mapOfExistingAccount.containsKey(conObj.Company__c) ){
                conObj.AccountId = mapOfExistingAccount.get(conObj.Company__c).Id;
            }else{
                Account objNewAcc = new Account(Name = conObj.Company__c);
                
                conObj.AccountId = objNewAcc.Id;
                
                listAccToInsert.add(objNewAcc);
                
            }
        }
        
        if(listAccToInsert.size()>0){
            insert listAccToInsert;
        }
        
        for(Account objAcc : listAccToInsert){
            mapNewAccountToInsertToId.put(objAcc.Name, objAcc.Id);
        }
        
        for(Contact objCon : ContactsToBeCreated){
            if(objCon.Company__c != NULL && !mapOfExistingAccount.containsKey(objCon.Company__c)){
                if(mapNewAccountToInsertToId.containsKey(objCon.Company__c))
                    objCon.AccountId = mapNewAccountToInsertToId.get(objCon.Company__c);
                
            }
        }
        
        
    }
    
    public static void showContact(List<Contact> newList ){
        
        Set<Id> setAccountsToUpdate = new Set<Id>();
        
        for(Contact con : newList){
            if(con.AccountId != NULL){
                setAccountsToUpdate.add(con.AccountId);
            }
        }
        
        List<Account> accListToUpdate = [SELECT Id,Number_of_Contacts__c,(SELECT Id FROM Contacts) FROM Account LIMIT 50000];
        
        
        
        for(Account acc : accListToUpdate){
            acc.Number_of_Contacts__c = acc.Contacts.size(); 
        }
        
        update accListToUpdate;
        
        
    }
    
  
    public static void sendEmail(List<Contact> conList){
        
        List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();
        
        for(Contact myContact : conList){
            if (myContact.Email != null && myContact.FirstName != null){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                List<String> sendTo = new List<String>();
                sendTo.add(myContact.Email);
                mail.setToAddresses(sendTo);
                
                mail.setSubject('New Contact Created');  
                String body = 'welcome to salesforce, your salesforce ID is' + myContact.Id +'.'; 
                
                mail.setHtmlBody(body);
                
                
                mails.add(mail);
                
                
            }
        }
        
        
        Messaging.sendEmail(mails);
        
        
    }
    
    public static void handleLastNameChange(Map<Id,Contact> mapold,Map<Id,Contact> mapnew,List<Contact> conList){
        for(Contact con:conList){
            Contact oldcon =  mapold.get(con.Id);
            Contact newcon = mapnew.get(con.Id);
            
            if(oldcon.LastName != newcon.LastName){
                newcon.updatedLastName__c = true;
                newcon.OldLastName__c = oldcon.LastName;
                update newcon;
            }
        }
    }
    
}