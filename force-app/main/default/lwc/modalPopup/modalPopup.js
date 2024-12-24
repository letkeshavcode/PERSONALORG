import { LightningElement, api ,track, wire} from "lwc";
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import SALUTATION from '@salesforce/schema/Contact.Salutation';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import AccountName from  '@salesforce/schema/Contact.AccountId';
import createContact from '@salesforce/apex/createContactCont.createContact';

import saveContactRecord from '@salesforce/apex/insertContactApexWeb.saveContactRecord';
//import image from '@salesforce/resourseURL/celebrationimage';
export default class Modal extends LightningElement {
viewPop = false;
@api recordId;

//@track image = image + '/celebrationimage.gif';

@api show() {
this.viewPop = true;
}

handleDialogClose() {
this.viewPop = false;
}



// Salutation; 
// FirstName;
// LastName;
// @track account ;


// rec = {
//     Salutation: this.salutation,
//     FirstName : this.firstname,
//     LastName : this.lastname,
//     AccountName:this.AccountName
  
// }

// @track contact = {};




// handleSalutationChange(event) {
// var sal= event.target.value;
// this.Salutation = event.target.value;
// this.contact.Salutation = this.Salutation;
// window.console.log("Salutation", this.Salutation);
// }

// handleFirstNameChange(event) {
// this.FirstName = event.target.value;
// this.contact.FirstName = this.FirstName;
// window.console.log("FirstName", this.FirstName);
// }

// handleLastNameChange(event) {
// this.LastName = event.target.value;
// this.contact.LastName = this.LastName;
// window.console.log("LastName", this.LastName);
// }

// handleClick() {
// //console.log(this.contact);
// alert(JSON.stringify(this.contact));
// saveContactRecord({con:this.contact})
// .then(result => {
//   //this.contacts = result;
//   console.log('res');

// })
// .catch(error => {
//   this.error = error.message;
//   alert(JSON.stringify(error));
// });



// }

// handleSave = event => {
   
//   event.preventDefault();
//   createContact(
//        this.Salutation,
//        this.FirstName,
//       this.LastName,
//        this.recordId
       
//   )
//   .then(result => {
//       console.log('Result \n ', result);
//       this.dispatchEvent(new ShowToastEvent({
//           title: 'Success',
//           message: 'Contact Created',
//           variant: 'success'
//       }));
//       this.closeAction();
//   })
//   .catch(error => {
//       console.error('Error: \n HAAN YHI ERROR HAI', error);
//   })

// }




}