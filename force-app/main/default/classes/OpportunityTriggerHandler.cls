public class OpportunityTriggerHandler {
    
    public static void fillWonReason(List<Opportunity>  newOpportunity){
        
        for(Opportunity opp : newOpportunity){
            if(opp.StageName == 'Closed Won' && opp.Won_Reason__c == NULL){
                opp.addError('Please fill the won reason');
            }
        }
    }
    
    public static void sendPdf( List<Opportunity> nlist){
        
        List<String> accIds = new List<String>();
       
        
        for(Opportunity opp : nList){
            if(opp.StageName=='Closed Won'){
                accIds.add(opp.AccountId);
               
                
            }
        }
        
       List<Account> accountList = [SELECT Id,Email_id__c FROM Account WHERE Id IN:accIds];
        
        for(Account accobj :accountList){
            if(accobj.Email_id__c!=NULL){
                EmailClass.sendPdf(accobj.id , accobj.Email_id__c);
            }
        }  
        
        
        
                 
        
    }
}