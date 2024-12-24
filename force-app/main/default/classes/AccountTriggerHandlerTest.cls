@isTest
public class AccountTriggerHandlerTest {
	@isTest
    public static void updateContactTest(){
    
        
        List<Account> acclist = new List<Account>();
        Account acc1 =new Account();
        acc1.Name = 'Test 1';
        insert acc1;
        
        Contact con = new Contact();
        con.LastName = 'Last Name';
        con.Salutation='Mr.';
        con.FirstName = 'Test';
        con.AccountId = acc1.Id;
        insert con;
        
        Map<Id,Account> mp1 = new Map<Id,Account>();
        mp1.put(acc1.Id,acc1);
        
        acc1.Name = 'Testtt 1';
        update acc1;
        
        Map<Id,account> mp2 = new Map<Id,Account>();
        mp2.put(acc1.Id,acc1);
        
        acclist.add(acc1);
        
        AccountTriggerHandler.updateContact(mp1,mp2,acclist);
        
        
        
         
    }
    
    
}