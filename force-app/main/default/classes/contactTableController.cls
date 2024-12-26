public with sharing class contactTableController {
    

    @AuraEnabled
    public static List<Contact> getContactList(){
        return [SELECT Id,Name,Email,CreatedDate FROM Contact LIMIT 50];
       }
}