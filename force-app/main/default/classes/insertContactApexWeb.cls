public class insertContactApexWeb {
@AuraEnabled(cacheable=true)
public static void saveContactRecord(Contact con){

System.debug('Working' + con);
try{
    System.debug('Inside try ' + con);
    insert con;
}catch(Exception ex){
    throw new AuraHandledException(ex.getMessage());
}
//  System.debug('New contact  ' + con);
//     Contact nc = new Contact();
//   nc.Salutation = con.Salutation;
//   nc.FirstName = con.FirstName;
//   nc.LastName = con.LastName;
//   insert nc;



}
}