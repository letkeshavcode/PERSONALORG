public class priceDiscountTriggerHelper {
    public static void updateDiscountOnChange(Map<Id,Book__c> om,Map<Id,Book__c> nm,List<Book__c> nl){
        List<Book__c> li = [SELECT Id,Price__c from Book__c WHERE Id in:om.keyset()];
        System.debug('list of ids '+ li );
        for(Book__c b:nl){
           // li.add(b.id);
        }
       
        
    }
    public static void updateDiscount(List<Book__c> newBookList){
       List<Book__c> nl = new List<Book__c>();
          System.debug('new list of books'+ newBookList);
        for(Book__c b: newBookList){
          
           // b.price__c = b.price__c - (b.price__c * 0.10);     
        }
      }
    
    
}