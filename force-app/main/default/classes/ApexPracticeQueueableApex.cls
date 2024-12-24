public class ApexPracticeQueueableApex implements Queueable  {

    public void execute(QueueableContext context){
        List<Contact> contactlist = [SELECT Id,LastName from Contact LIMIT 50000];
        for(Contact c: contactlist){
            c.LastName = c.LastName +  '	queueable';
        }
        
        update contactlist;
    }
}