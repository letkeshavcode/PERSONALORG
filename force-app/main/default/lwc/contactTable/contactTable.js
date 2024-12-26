import { LightningElement,track } from 'lwc';
import getContactListBasedOnTimeZone from '@salesforce/apex/contactTableController.getContactList';

const columns = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Created Date', fieldName: 'CreatedDate', type: 'Date' }
];

export default class contactTable extends LightningElement{
@track data=[];
    columns = columns;

connectedCallback(){
    this.getContactList();
}

    getContactList(){
        getContactListBasedOnTimeZone().then(res=>{
            console.log('-->res',res);
            this.data = res;
            this.data = this.data;
            console.log('-->res',this.data);
        }).catch(err=>{
            console.error('error in getting data',err);
        })
    }
    
}