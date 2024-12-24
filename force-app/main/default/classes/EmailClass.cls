public class EmailClass {
    @future(callout=true)
    public static void sendPdf(Id accObj, String mail){
        List<String> accEmail =new List<String>();
        accEmail.add(mail);
        PageReference pdf = Page.oppProduct;
        pdf.getParameters().put('id',(String)accObj);
        pdf.setRedirect(true);
        Blob body;
        body=pdf.getContent();
        Messaging.EmailFileAttachment fa = new Messaging.EmailFileAttachment();
        fa.setFileName('Product.pdf');
        fa.setBody(body);
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject('Products');
        email.setToAddresses(accEmail);
        email.setPlainTextBody('Please Find the attached product details');
        email.setFileAttachments(new Messaging.EmailFileAttachment[]{fa});
        Messaging.SendEmailResult[] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
    }

}