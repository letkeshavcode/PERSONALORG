public class LeadTriggerHandler {
	
    public static void preventContactCreation(List<Lead> allnewleads){
		
        List<String> leadName = new List<String>();
        for(Lead l1 : allnewleads){
         	leadName.add(l1.Name);
        }        
        
        List<Contact> conList = [SELECT Id,Name FROM Contact WHERE Name IN:leadName LIMIT 50000];
        Set<String> setofcontact = new Set<String>();
        for(Contact c : conList){
            setofcontact.add(c.Name);
        }
        
        for(lead L : allnewleads){
            if(setofcontact.contains(L.Name)){
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error Message');
				ApexPages.addMessage(myMsg);
            }
        }
        
        
    }
    
}