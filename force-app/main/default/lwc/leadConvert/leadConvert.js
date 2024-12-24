import { LightningElement,track ,api,wire} from 'lwc';
// import insertAccountMethod from '@salesforce/apex/recordsController.insertAccountMethod';
import accName from '@salesforce/schema/Account.Name';
import ContactFirstName from '@salesforce/schema/Contact.FirstName';
import ContactSalutation from '@salesforce/schema/Contact.Salutation';
import ContactLastName from '@salesforce/schema/Contact.LastName';
import createRec from '@salesforce/apex/recordsController.createRec';
import oppName from '@salesforce/schema/Opportunity.Name';
import LEAD_STATUS from '@salesforce/schema/Lead.Status';
import { loadStyle } from "lightning/platformResourceLoader";
import modal from "@salesforce/resourceUrl/externalcssCL";
import LEAD from '@salesforce/schema/Lead';
import LEAD_F_NAME from '@salesforce/schema/Lead.FirstName';
import LEAD_L_NAME from '@salesforce/schema/Lead.LastName';
import LEAD_COMPANY from  '@salesforce/schema/Lead.Company';
//import getLeadRec from '@salesforce/apex/recordsController.getLeadRec';
import { getRecord,getFieldValue  } from 'lightning/uiRecordApi';
//import convertLead from '@salesforce/apex/recordsController.convertLead';
import { CloseActionScreenEvent } from 'lightning/actions';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class InsertAccountLwc extends LightningElement {
//showPop = true;
//accountSearchValue;
@track accountid;
@track error;    
@api recordId;
@track getAccountRecord={
    Name:accName,       
        
};   

// @api item;
@track accNAme_new;
// @track newRecord={
//     AccountName :accName,
//     ContactSalutation:ContactSalutation,
//     ContactFirstName :ContactFirstName,
//     ContactLastName:ContactLastName,
//     OpportunityName:oppName
// };



@track newRecord={

    AccountId:'',
    AccountName :'',
    ContactSalutation:'',
    ContactFirstName :'',
    ContactLastName:'',
    OpportunityName:''
};

@track chooseExistingAccountName='';



@wire(getRecord, { recordId: '$recordId', fields: [LEAD_F_NAME,LEAD_L_NAME,LEAD_COMPANY] })
record;

get nameValue() {
    this.newRecord.AccountName = getFieldValue(this.record.data,LEAD_COMPANY);
    return this.record.data ? getFieldValue(this.record.data,LEAD_COMPANY) : '';
}

get fNameValue(){
    this.newRecord.ContactFirstName =getFieldValue(this.record.data,LEAD_F_NAME);
    //console.log('Contact First Name '+this.newRecord.ContactFirstName);
    return this.record.data ? getFieldValue(this.record.data,LEAD_F_NAME) : '';
}
get lNameValue(){
    this.newRecord.ContactLastName =getFieldValue(this.record.data,LEAD_L_NAME);
    // console.log('Contact Last Name '+this.newRecord.ContactLastName);
    return this.record.data ? getFieldValue(this.record.data,LEAD_L_NAME) : '';
}

get oppValue() {
    // this.newRecord.OpportunityName = this.record.data.LEAD_COMPANY;
    //console.log(getFieldValue(this.record.data,LEAD_COMPANY));
    //console.log('before'+this.newRecord.OpportunityName);
    this.newRecord.OpportunityName = getFieldValue(this.record.data,LEAD_COMPANY);
    // console.log('opportunity name'+this.newRecord.OpportunityName);
    return this.record.data ? getFieldValue(this.record.data,LEAD_COMPANY) : '';
}
// @track newRecord={
//     AccountName :LEAD_COMPANY+'-',
//     ContactSalutation:'',
//     ContactFirstName :LEAD_F_NAME,
//     ContactLastName:LEAD_L_NAME,
//     OpportunityName:LEAD_COMPANY + '-'
// };

// leadfirstname = LEAD_F_NAME;
// leadlastname = LEAD_L_NAME;
// leadcompany = LEAD_COMPANY;
checkBoxVal = false;
leadStatus = LEAD_STATUS;
isOpportunityCardOpen = false;
isContactCardOpen = false;
isAccountCardOpen = false;
accountRB='';
//    off(){
//        this.showPop = false;
// }

connectedCallback() {
    loadStyle(this, modal);
  }

handleCancel(event){
var url = window.location.href; 
var value = url.substr(0,url.lastIndexOf('/') + 1);
window.history.back();
return false;
}


get options() {
return [
    { label: '--None--', value: '' },
    { label: 'Mr.', value: 'Mr.' },
    { label: 'Ms.', value: 'Ms.' },
    { label: 'Mrs.', value: 'Mrs.' },
    { label: 'Dr.', value: 'Dr.' },
    { label: 'Prof.', value: 'Prof.' },
];
}
nameInpChange(event){
    // this.getAccountRecord.Name = event.target.value;
    this.newRecord.AccountName = event.target.value;
    window.console.log(this.newRecord.AccountName);
    //    this.accNAme_new = event.target.value;
    //    window.console.log(this.accNAme_new);
    
    //window.console.log(this.getAccountRecord.Name);
    }

    FirstNameInpChange(event){
        this.newRecord.ContactFirstName=event.target.value;
        window.console.log(this.newRecord.ContactFirstName);
    }
    SalutationInpChange(event){
        this.newRecord.ContactSalutation=event.target.value;
        window.console.log(this.newRecord.ContactSalutation);
    }
    LastNameInpChange(event){
        this.newRecord.ContactLastName = event.target.value;
        window.console.log(this.newRecord.ContactLastName);
    }
    OpportunityNameInpChange(event){
    this.newRecord.OpportunityName=event.target.value;
    window.console.log(this.newRecord.OpportunityName);
}


handleShowModal() {
   
  }


    save(){
        
        console.log('record -----------'+ JSON.stringify(this.newRecord.AccountName));
        console.log('record Id' +this.recordId);
        //this.dispatchEvent(new CloseActionScreenEvent());
        
        const modal = this.template.querySelector("c-modal-popup");
        modal.show();
        // convertLead({recId:JSON.stringify(this.recordId)}).then(result=>{
        //    console.log('Record Id-------');
        //  }).catch(error=>{
        //     this.error=error.message;
        //     window.console.log(this.error);
        //     });;

        // createRec({objwrapped:JSON.stringify(this.newRecord)})
        // .then(result=>{
        // const toastEvent = new ShowToastEvent({
        //     title:'Success!',
        //     message:'Records created successfully',
        //     variant:'success'
        //     });
        //     this.dispatchEvent(toastEvent); 

        // })
        // .catch(error=>{
        // this.error=error.message;
        // window.console.log(this.error);
        // });
       
    }
   
handleToggleSection(event){
    
    console.log( 'Selected Sections ' + event.detail.openSections );

}

accountToggle(event){
    console.log(this.template.querySelector('[data-id="acntaccordian"]').getAttribute('aria-expanded'));


        var txtarea1 = this.template.querySelector('[data-id="ta1"]');
        var flag = this.template.querySelector('[data-id="ta1"]').classList.contains('hidden');
        if(flag==true){
            this.template.querySelector('[data-id="ta1"]').classList.remove('hidden');

        }else if(flag==false){
            this.template.querySelector('[data-id="ta1"]').classList.add('hidden');
        }
        
    //     if(txtarea1){
    //     //this.template.querySelector('[data-id="ta1"]').className ='hidden';
        
    //     console.log('working1..' + this.template.querySelector('[data-id="ta1"]').classList.contains('hidden'));
    //  }

    // console.log('Class list----'+ accounttextarea.classList);
    
}
accountToggleThroughRB(event){
    if(this.template.querySelector('[data-id="ARBCE"]').checked==true && this.isAccountCardOpen==false){
        this.template.querySelector('[data-id="ta1"]').classList.remove('hidden');
        isAccountCardOpen= true;
        this.accountRB = 'Existing';

    }else if(this.template.querySelector('[data-id="ARBCE"]').checked==false && this.isAccountCardOpen==true){
        this.template.querySelector('[data-id="ta1"]').classList.remove('hidden');
        this.accountRB = 'New';
        this.newRecord.AccountName='';
        isAccountCardOpen = false;
        console.log('RB clicked');
    }

    
}

contactToggle(event){
    var flag1 = this.template.querySelector('[data-id="ta2"]').classList.contains('hidden');
    var flag2 = this.template.querySelector('[data-id="sal"]').classList.contains('hidden');
    var flag3 = this.template.querySelector('[data-id="ln"]').classList.contains('hidden');

    if(flag1 == true && flag2==true && flag3==true){
        this.template.querySelector('[data-id="ta2"]').classList.remove('hidden');
        this.template.querySelector('[data-id="sal"]').classList.remove('hidden');
        this.template.querySelector('[data-id="ln"]').classList.remove('hidden');
        this.isContactCardOpen = true;
    }else{
        this.template.querySelector('[data-id="ta2"]').classList.add('hidden');
        this.template.querySelector('[data-id="sal"]').classList.add('hidden');
        this.template.querySelector('[data-id="ln"]').classList.add('hidden');
        this.isContactCardOpen = false;
    }

}

contactToggleThroughRB(event){
        
        if(this.template.querySelector('[data-id="CRBCE"]').checked == true && this.isContactCardOpen==false){
        this.template.querySelector('[data-id="ta2"]').classList.remove('hidden');
        this.template.querySelector('[data-id="sal"]').classList.remove('hidden');
        this.template.querySelector('[data-id="ln"]').classList.remove('hidden');
        this.isContactCardOpen = true;
        }else if(this.template.querySelector('[data-id="CRBCE"]').checked==false && this.isContactCardOpen==true){
        this.template.querySelector('[data-id="ta2"]').classList.remove('hidden');
        this.template.querySelector('[data-id="sal"]').classList.remove('hidden');
        this.template.querySelector('[data-id="ln"]').classList.remove('hidden');
        this.isContactCardOpen = true;
        } 
        
}

opportunityToggle(event){
    

    var flag1=this.template.querySelector('[data-id="ta3"]').classList.contains('hidden');
    if(flag1==true){
        this.template.querySelector('[data-id="ta3"]').classList.remove('hidden');
        this.isOpportunityCardOpen = true;
    }else{
        this.template.querySelector('[data-id="ta3"]').classList.add('hidden');
        this.isOpportunityCardOpen = false;
    }

    if(this.isOpportunityCardOpen == true && flag1==true ){
        this.template.querySelector('[data-id="ta3"]').classList.remove('hidden');  
    }else if(this.isOpportunityCardOpen == false && this.template.querySelector('[data-id="ta3"]').classList.contains('hidden')==false){
        this.template.querySelector('[data-id="ta3"]').classList.add('hidden');
    }

    
}
opportunityToggleThroughRB(event){
    //console.log('event'+event.detail);
    if(this.template.querySelector('[data-id="ORBCE"]').checked==true){
        this.template.querySelector('[data-id="ta3"]').classList.remove('hidden');
        this.template.querySelector('[data-id="oppaccordianbtn"]').disabled=true;

    }else if(this.template.querySelector('[data-id="ORBCE"]').checked==false){
        this.template.querySelector('[data-id="ta3"]').classList.add('hidden');
    }

}


    

// handleAccountSearch(event){
//     this.accountSearchValue = event.target.value;
//     console.log('Search value-----' + this.accountSearchValue);
// }

lookupRecord(event){
    event.detail.selectedRecord;
    if(event.detail.selectedRecord){
       // console.log('event working----' + JSON.stringify(event.detail.selectedRecord));
        //console.log(this)
        console.log('Id---'+event.detail.selectedRecord.Id);
        console.log('Name---'+event.detail.selectedRecord.Name);
        console.log('Object Name---'+event.detail.typeofobj);
       if(event.detail.typeofobj=='account'){
           this.newRecord.AccountName = event.detail.selectedRecord.Name;
           this.newRecord.AccountId = event.detail.selectedRecord.Id;
       }else if(event.detail.typeofobj=='contact'){
        this.newRecord.ContactFirstName = event.detail.selectedRecord.FirstName;
        this.newRecord.ContactLastName = event.detail.selectedRecord.LastName;
         console.log(JSON.stringify(event.detail.selectedRecord));
       }
    }
    
    //console.log('this is showing---'+event.detail.selectedRecord);
}


get status() {
    return [
        { label: 'Closed - Converted', value: 'Closed - Converted' },
        
    ];
}


handleChBox(event){
    this.checkBoxVal = event.target.checked;
    // console.log('value is---- ' + this.checkBoxVal);
    if(this.checkBoxVal == true){
        console.log('check box '+this.checkBoxVal);
       
            this.template.querySelector('[data-id="ORBCN"]').disabled = true;
        //radiobtnCN.disabled = true;
            this.template.querySelector('[data-id="ORBCE"]').disabled = true;
        // radiobtnCE.disabled = true;
        this.template.querySelector('[data-id="OCNT"]').disabled = true;
        this.template.querySelector('[data-id="OSB"]').disabled = true;
        this.newRecord.OpportunityName = '';
        console.log('opportunity name' +  JSON.stringify(this.newRecord));

    }else{
        console.log('check box '+this.checkBoxVal);
        this.template.querySelector('[data-id="ORBCN"]').disabled = false;
        this.template.querySelector('[data-id="ORBCE"]').disabled =false;
        this.template.querySelector('[data-id="OCNT"]').disabled =false;
        this.template.querySelector('[data-id="OSB"]').disabled =false;
        console.log('opportunity name' +  JSON.stringify(this.newRecord));
    }

    

}

}