public with sharing class recordsController {
public recordsController() {

}
// @AuraEnabled
// public static Account insertAccountMethod(Account accountObj ){
//     try {
//         insert accountObj;
//         return accountObj;
//     } catch (Exception exp) {
//         throw new AuraHandledException(exp.getMessage());
//     }
// }
    @AuraEnabled
    public static void convertLead(String recId){
        try {
            System.debug('Rec id--'+ recId );
            Database.LeadConvert lc = new database.LeadConvert();
            lc.setLeadId(recId);
            
            LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
            lc.setConvertedStatus(convertStatus.MasterLabel);
            
            Database.LeadConvertResult lcr = Database.convertLead(lc);
            System.assert(lcr.isSuccess());
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }


@AuraEnabled
public static void createRec(String objwrapped){
    try {
        System.debug('result ------'+objwrapped);
        allRecordWrapper n = new allRecordWrapper();
        n = (allRecordWrapper)JSON.deserialize(
            objwrapped, allRecordWrapper.class); 
            System.debug('Wrapper class object'+ n);
        Account acct = new Account();
        acct.Name = n.AccountName;
        if(n.AccountId !=''){
            acct.Id = n.AccountId;
        }
        
        upsert acct;

        Contact con = new Contact();
        con.Salutation = n.ContactSalutation;
        con.FirstName = n.ContactFirstName;
        con.LastName = n.ContactLastName;
        con.AccountId = acct.Id;
        upsert con;

        Opportunity opp = new Opportunity();
        if(n.OpportunityName!= ''){
            opp.Name = n.OpportunityName;
            opp.StageName = ('Prospecting');
            opp.CloseDate = Date.today();
            opp.AccountId = acct.Id;
            insert opp;
        }

        


        
    //    Account acct = objWrapped.acn;
    //    insert acct;
    //    Contact con = objWrapped.cont;
    //    insert con;
        
            

    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}


public class allRecordWrapper{
// public Account acn{get;set;}
// public Contact cont{get;set;}

// public String LeadRecordId{get;set;}
public String AccountName{get;set;}
public String AccountId{get;set;}
public String ContactSalutation{get;set;}
public String ContactFirstName{get;set;}
public String ContactLastName{get;set;}
public String OpportunityName{get;set;}
    
}

// public class leadsWrapper{
//     public String CompanyName{get;set}
//     public String Name{get;set;}
    

// }


}