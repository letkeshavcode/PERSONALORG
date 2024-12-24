@isTest
public class ContactTriggerHandlerTest {
	@isTest
    static void showContactTest(){
        Account acc = new Account();
        acc.Name = 'Test 691';
        insert acc;
        
       /* Account existingAccount = [SELECT Id,Number_of_Contacts__c FROM Account WHERE Id=:acc.Id ];
        
        Decimal noc = existingAccount.Number_of_Contacts__c;  //number of contacts before inserting new one
        */
        
        List<Contact> conList = new List<Contact>();
        
        
        Contact con = new Contact();
        con.Salutation='Ms.';
        con.FirstName = 'Con1';
        con.LastName = 'Test';
        con.AccountId = acc.Id;
        Insert con;
        conList.add(con);
       /* Account a = [SELECT Id,Number_of_Contacts__c FROM Account WHERE Id=:acc.Id ];  //number of contacts after inserting
        
        System.assertEquals(a.Number_of_Contacts__c , noc+1);
        */
        ContactTriggerHandler.showContact(conList);
        
    }
    
    @isTest
    static void sendEmailTest(){
        
        Contact con = new Contact();
        con.FirstName = 'Test';
        con.LastName = '6009';
        con.Email = 'keshav.parashar.mail@gmail.com';
        
        List<Contact> listCon = new List<Contact>();
        listCon.add(con);
        
        insert con;
            
        
       ContactTriggerHandler.sendEmail(listCon);
        
            
        
        
        
    }
    
    @isTest 
    static void setAccountNameTest(){
        Account acc = new Account();
        acc.Name = 'Testing account 1';
        insert acc;
        
        List<Contact> conList = new List<Contact>();
        
        Contact con = new Contact();
        con.Salutation ='Mr.';
        con.LastName = 'sharma';
        con.Company__c = 'Testing account 1';
        
        conList.add(con);
        insert con;
        
        ContactTriggerHandler.setAccountName(conList);
        
    }
    
}