public with sharing class createContactCont {
    
    @AuraEnabled(cacheable=true)
    public static void createContact(String Salutation, String FirstName ,String LastName){
        try {
          //  System.debug('inside try block' + Salutation + FirstName + LastName + recordId);
            Contact con = new Contact(Salutation = Salutation, FirstName = FirstName ,LastName = LastName);
            insert con;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}