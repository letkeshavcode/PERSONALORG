public class email_class{
	
    Public string ToAddresses {get;set;}
    Public string CCAddresses {get;set;}
    Public string opportunityId {get;set;}
    Public string subject {get;set;}
    public string email_body {get;set;}
    public string emailTo {get;set;}
    public string emailCC {get;set;}
	
	public email_class(ApexPages.StandardController controller) {
		//opportunityId = ApexPages.currentPage().getParameters().get('id');
		opportunityId = '0065j00000TxB16AAF';
        emailTo = 'keshavp@appcino.com';
    }
    
    public static void sendAttachment(String opportunityId, String emailTo,String email_body){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); // set the to address
		mail.setToAddresses(new String[] {emailTo}); 
		//mail.setCcAddresses(new String[] {emailCC});   //set the cc address
		//mail.setSubject(subject);
		//mail.setBccSender(false);
		mail.setUseSignature(false);
		mail.setPlainTextBody(email_body);
		mail.setWhatId(opportunityId);// Set email file attachments 

		List<Messaging.Emailfileattachment> fileAttachments = new List<Messaging.Emailfileattachment>();

		for (Attachment a : [select Name, Body, BodyLength from Attachment where ParentId = :opportunityId]){  // Add to attachment file list  
			Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();  
			efa.setFileName(a.Name); 
			efa.setBody(a.Body); 
			fileAttachments.add(efa);
		}
		mail.setFileAttachments(fileAttachments);// Send email
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
		//return null;
    }
	
    Public PageReference send(){

		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); // set the to address
		mail.setToAddresses(new String[] {emailTo}); 
		mail.setCcAddresses(new String[] {emailCC});   //set the cc address
		mail.setSubject(subject);
		mail.setBccSender(false);
		mail.setUseSignature(false);
		mail.setPlainTextBody(email_body);
		mail.setWhatId(opportunityId);// Set email file attachments 

		List<Messaging.Emailfileattachment> fileAttachments = new List<Messaging.Emailfileattachment>();

		for (Attachment a : [select Name, Body, BodyLength from Attachment where ParentId = :opportunityId]){  // Add to attachment file list  
			Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();  
			efa.setFileName(a.Name); 
			efa.setBody(a.Body); 
			fileAttachments.add(efa);
		}
		mail.setFileAttachments(fileAttachments);// Send email
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
		return null;
	}
}