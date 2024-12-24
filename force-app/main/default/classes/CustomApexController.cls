public with sharing class CustomApexController {
    public CustomApexController() {

    }
    public static List<sObject> getObjectData(String objectName,Integer number_of_records){
        List<sObject> record_list = new List<sObject>();
        
        // String query =  ;
        if(number_of_records <50000 && number_of_records>0){
             record_list = Database.query('SELECT ID,Name FROM ' + objectName + ' ORDER BY Name LIMIT ' + number_of_records);
            System.debug('record list'+ record_list);
        }
    return record_list;    

    }
}


            //  SObjectType sObjType = dynamicObj.getSObjectType();
            //  DescribeSobjectResult sObjDescribe = sObjType.getDescribe();
            //     for(Schema.ChildRelationship rels :sObjDescribe.getChildRelationships()){
            //              if(String.ValueOf(rels.getChildSObject()) == childsObj){
            //                      rltname = rels.getRelationshipName();
            //                     System.debug('Relationship Name ::: '+rltname);
            //                 }
            //         }
               
            //   SObjectType rltnObj = ((SObject) Type.forName(rltname).newInstance()).getSObjectType();
            // System.debug('rltnObj:: '+rltnObj); */