public class  PDFcontroller {
    
    
    public List<OpportunityLineItem> oppListItem {get; set;}
    Opportunity oppObj = [SELECT Id FROM Opportunity WHERE AccountId =:ApexPages.CurrentPage().getParameters().get('id')];
    
    public   PDFcontroller(){
         
        oppListItem=[SELECT Product2Id,UnitPrice,Quantity FROM OpportunityLineItem WHERE OpportunityId =:oppObj.Id];
        
    }
    
}