public class MyAccountController {
	
    public List<Account> accountList;
    
    public  List<Account> getAccountList(){
        return accountList;
    }
    
    public   void setAccountList(List<Account> accList){
        this.accountList =  accList;
    }
    
    public MyAccountController(){
        accountList = [SELECT Id,Name FROM Account LIMIT 100];
    }
    
}