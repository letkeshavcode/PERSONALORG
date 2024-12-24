public with sharing class demoClass {
    public demoClass() {

    }

    @AuraEnabled(cacheable = true)
    public static List<Contact> getContactList(){
        return [SELECT Id,Name,Email FROM Contact LIMIT 20];
       }
}