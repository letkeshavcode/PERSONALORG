import { LightningElement,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import ACCOUNT_CON from '@salesforce/schema/Contact.AccountId';


export default class createCon extends LightningElement {
@api recordId;
    
objectApiName = CONTACT_OBJECT;
fields =[NAME_FIELD,ACCOUNT_CON];
//accountid = ACCOUNT_CON;

handleSuccess(event) {
    const toastEvent = new ShowToastEvent({
        title: "Contact created",
        message: "Record ID: " + event.detail.id,
        variant: "success"
    });
    this.dispatchEvent(toastEvent);
}
}