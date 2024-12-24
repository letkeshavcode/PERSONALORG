public with sharing class landingPage {
   
    @AuraEnabled(cacheable=true)
    public static List<Categories__c> getCategoryInfo(){
        List<Categories__c> categoryinfo = new List<Categories__c>();

        categoryinfo = [SELECT Id,Name,image__c FROM  Categories__c LIMIT 10];
        
        return categoryinfo;

    }

}