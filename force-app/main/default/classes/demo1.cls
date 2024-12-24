public with sharing class demo1 {
    public static void makeOpportunity(){
       List<Account> accountList = [SELECT Id,Name FROM Account WHERE CreatedDate=THIS_YEAR LIMIT 10];
       List<Opportunity> oppToCreate = new List<Opportunity>();
        
        if(!accountList.isEmpty()){
            for(Account acc : accountList){
                 Opportunity opp = new Opportunity();
                 opp.Name = acc.name;
                 opp.CloseDate= System.today();
                opp.StageName='Prospecting';
                opp.AccountId = acc.Id;
                oppToCreate.add(opp);
                
            }
        }
        if(!oppToCreate.isEmpty()){
            insert oppToCreate;
        }
        
       
   }
   
}