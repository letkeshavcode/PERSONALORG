public class AccountNContactController {
    
    public List<Account> acct{get;set;}
    
    
    public AccountNContactController(){
        acct=[select id,name,(select id,FirstName,LastName from contacts)from account limit 1000 OFFSET 1];
    }
    
    
    
}