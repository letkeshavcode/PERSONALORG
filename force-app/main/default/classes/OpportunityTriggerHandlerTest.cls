@isTest
public class OpportunityTriggerHandlerTest {
    @isTest
    static void fillWonReasonTest(){
        List<Opportunity> opplist= new List<Opportunity>();
        Opportunity opp = new Opportunity();
        opp.Name = 'Test 9090';
        opp.StageName = 'Closed Won';
        opp.CloseDate = date.parse('05/11/2012');
        opp.Won_Reason__c = 'Aisehi';
        opplist.add(opp);
        
        // try{
        insert opp;
        
        
        //}
        // catch(Exception se){
        //  System.assert(se.getMessage().contains('Please fill the won reason'));
        
        //}
        
        OpportunityTriggerHandler.fillWonReason(opplist);
        
        
        
    }
    
    @isTest
    static void fillWonReason2(){
        List<Opportunity> opplist= new List<Opportunity>();
        Opportunity opp = new Opportunity();
        opp.Name = 'Test 9090';
        opp.StageName = 'Closed Won';
        opp.CloseDate = date.parse('05/11/2012');
       // opp.Won_Reason__c = 'Aisehi';
        opplist.add(opp);
        
        try{
        insert opp;
        
        }
        catch(Exception se){
         System.assert(se.getMessage().contains('Please fill the won reason'));
        
        }
        
    }
    
}