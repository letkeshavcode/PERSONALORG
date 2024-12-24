public class updatePhone {
    public static void updatePhoneNum(){
        
        List<Contact> conList = [SELECT Id, FirstName ,LastName ,Phone ,Account.Phone FROM Contact WHERE AccountId!=null];
        
        if(!conList.isEmpty()){
            for(Contact con:conList){
                if(con.Phone ==null){
                    con.Phone=con.Account.Phone;
                }
                
            }
            
        }
        
        if(!conList.isEmpty()){
            update conList;
        }
        
    }
}