public class DataTypeDemo {
    
    public void methodDemo(){ 
        
        List<Account> accList = new List<Account>();
        accList=[SELECT id,Name from Account Limit 3];
        
        for(Account acc:accList){
            System.debug(acc.id +' ' + acc.name+ ' ');
        }
        
        
    }
}