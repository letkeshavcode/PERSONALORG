import { LightningElement,api } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import CONTACT_OBJECT  from '@salesforce/schema/Contact';
import SALUTATION from '@salesforce/schema/Contact.Salutation';
import F_NAME from '@salesforce/schema/Contact.FirstName';
import L_NAME from '@salesforce/schema/Contact.LastName';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import OPP_NAME  from '@salesforce/schema/Opportunity.Name';
import OPP_STAGENAME from '@salesforce/schema/Opportunity.StageName';
import OPP_CLOSEDDATE from '@salesforce/schema/Opportunity.CloseDate';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCOUNT_ID from  '@salesforce/schema/Account.Id';
import ACCOUNT_NAME from  '@salesforce/schema/Contact.AccountId';
import LEAD from '@salesforce/schema/Lead';
import LEAD_RECORD_OWNER from '@salesforce/schema/Lead.OwnerId';
import LEAD_STATUS from '@salesforce/schema/Lead.Status';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import ACCOUNT_RECORD_OWNER from '@salesforce/schema/Account.OwnerId';
import CONTACT_RECORD_OWNER from '@salesforce/schema/Contact.OwnerId';
import OPPORTUNITY_RECORD_OWNER from '@salesforce/schema/Opportunity.OwnerId';
import StageName from '@salesforce/schema/Opportunity.StageName';

export default class ConvertLead extends LightningElement {
showModalCL = true;

accountObject = ACCOUNT_OBJECT;
nameField = NAME_FIELD;
salutation = SALUTATION;
fname = F_NAME;
lname = L_NAME;
oppname = OPP_NAME;
oppcloseddate = OPP_CLOSEDDATE;
oppstage = OPP_STAGENAME;
accountId = ACCOUNT_ID;
contactAccount = ACCOUNT_NAME;
leadowner = LEAD_RECORD_OWNER;
leadstatus = LEAD_STATUS;
opportunity_record_owner = OPPORTUNITY_RECORD_OWNER;
contact_record_owner = CONTACT_RECORD_OWNER;
account_record_owner= ACCOUNT_RECORD_OWNER;
recordOwner = LEAD_RECORD_OWNER;
@api recordId;

@api show() {
    this.showModalCL= true;
    }
    off(){
        this.showModalCL = false;
    }

    
// handleAccountCreated(event){
//     event.preventDefault();
//     let fields = event.detail.fields;
//     this.template.querySelector('lightning-record-edit-form').submit(fields);
// }

// handleContactCreated(event){
//     event.preventDefault();
//     let fields = event.detail.fields;
//     this.template.querySelector('lightning-record-edit-form').submit(fields);
// }

// handleOpportunityCreated(event){
//     event.preventDefault();
//     let fields = event.detail.fields;
//     this.template.querySelector('lightning-record-edit-form').submit(fields);
        
// }

// handleValueChange(event) {
   
// }


handleConvert(event){
    event.preventDefault();
    
    
    //let fields = event.detail.fields;
    const inputFields = this.template.querySelectorAll(
        'lightning-input-field'
    );
    if (inputFields) {
        inputFields.forEach(field => {
            if(field.fieldName=='Status'){
                field.value = 'Closed - Converted';
            }
            if(field.fieldName=='OwnerId'){
                field.value = this.leadowner;
            }
           
            if(field.fieldName == 'StageName')
               {field.value = 'Prospecting';}
            // if(field.fieldName=='Close Date'){
                
            // } 


        });
    }

    const fields = event.detail.fields;
    // fields.oppstage = 'Prospecting';
    console.log('working fine ');
    //this.template.querySelector('lightning-record-edit-form').submit();
    this.template.querySelectorAll('lightning-record-edit-form').forEach((form) => {form.submit(fields)});

    // let forms = this.template.querySelectorAll('lightning-record-edit-form');
    // for( i =0 ;i<forms.length;i++){
    //     console.log(i);
    //     forms[i].submit();
    // }

}

// handleSave = event => {
//    console.log('fine');
//     //event.preventDefault();
//     this.template.querySelector('lightning-record-edit-form').submit()
//     .then(result => {
//         console.log('Result \n ', result);
//         this.dispatchEvent(new ShowToastEvent({
//             title: 'Success',
//             message: 'Contact Created',
//             variant: 'success'
//         }));
//         this.closeAction();
//     })
//     .catch(error => {
//         console.error('Error: \n HAAN YHI ERROR HAI', error);
//     })

// }

handleToggleSection(event){

    console.log( 'Selected Sections ' + event.detail.openSections );

}

handleCancel(){
    const inputFields = this.template.querySelectorAll(
        'lightning-input-field'
    );
    if (inputFields) {
        inputFields.forEach(field => {
            field.reset();
        });
    }
}



//toast message code
// if(this.recordId !== null){
//     this.dispatchEvent(new ShowToastEvent({
//             title: "SUCCESS!",
//             message: "New record has been created.",
//            variant: "success",
//         }),  
//    );    
//  }

//Radio Buttons



  



}