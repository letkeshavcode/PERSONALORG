public with sharing class FetchObjectsAndFields {
    @AuraEnabled(cacheable = true)
    public static List<DataWrapper> fetchObjects()
    {
        List<DataWrapper> objWrapper = new List<DataWrapper>();
        List<Schema.SObjectType> myObj = new List<Schema.SObjectType>(); 
        myObj.add(Schema.getGlobalDescribe().get('Account'));  //taking only required object if i want all object i use Schema.getGlobalDescriber().values();
        myObj.add(Schema.getGlobalDescribe().get('Contact'));
        //myObj.add(Schema.getGlobalDescribe().get('TestingObject__c'));
        myObj.add(Schema.getGlobalDescribe().get('Case'));
        myObj.add(Schema.getGlobalDescribe().get('Lead'));
        for(Schema.SObjectType o:myObj)
        {
            Schema.DescribeSObjectResult objResult = o.getDescribe();
            DataWrapper obj = new DataWrapper();
            obj.objLabel = objResult.getLabel();
            obj.objName = objResult.getName();
            objWrapper.add(obj);
        }
        return objWrapper;
    }
    @AuraEnabled(cacheable=true)
    public static List<DataWrapper> fetchFields(String obj)
    {
     List<DataWrapper> fieldsWrapper = new List<DataWrapper>();
     Schema.SObjectType ob = Schema.getGlobalDescribe().get(obj);
     Map<String,Schema.SObjectField> flds = ob.getDescribe().fields.getMap();
     for(Schema.SObjectField fld:flds.values())
     {
         DataWrapper f = new DataWrapper();
         f.objLabel = fld.getDescribe().getLabel();
         f.objName = fld.getDescribe().getName();
         fieldsWrapper.add(f);
     }
     return fieldsWrapper;
    }

    @AuraEnabled(cacheable=true)
    public static List<sObject> getRecords(String obj, List<String> flds)
    {
        String fieldsToQuery = string.join(flds,',');
       String s = 'Select '+fieldsToQuery+' from '+obj+' Limit 10';
       List<sObject> recordsList =  Database.query(s);
       return recordsList;
    }

    public class DataWrapper{
        @AuraEnabled
        public String objLabel{get;set;}
        @AuraEnabled
        public String objName{get;set;}
    }
}