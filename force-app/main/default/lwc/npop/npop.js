import { LightningElement,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import SALUTATION from '@salesforce/schema/Contact.Salutation';
import F_NAME from '@salesforce/schema/Contact.FirstName';
import L_NAME from '@salesforce/schema/Contact.LastName';
import ACC_ID from '@salesforce/schema/Contact.AccountId';


export default class Npop extends LightningElement {
 @api recordId;
objectApiName = CONTACT_OBJECT;
Salutation = SALUTATION;
Fname = F_NAME;
Lname = L_NAME;
AccId = ACC_ID;

showModal = true;

@api show(){
    this.showModal = true;
}

handleDialogClose() {
    this.showModal = false;
    }

handleSuccess(event){
    const toastEvent = new ShowToastEvent({
        title: "Contact created",
        message: "Record ID: " + event.detail.id,
        variant: "success"
    });
    this.dispatchEvent(toastEvent);
}
}