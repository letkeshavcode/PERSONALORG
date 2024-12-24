import { LightningElement,track,api } from 'lwc';

export default class MultipleRecords extends LightningElement {

@track recordObj=[{
Name:'',
Date:'',
Status:''
}];

handleChange(event){
var rowIndex = event.currentTarget.dataset.index;
//console.log('event===',event.target.name);
if(event.target.name == 'Name') {
    console.log('event me aarha h');
    this.recordObj[rowIndex].Name = event.target.value;
    console.log('value',event.target.value);
}
 else if(event.target.name == 'Status') {
    this.recordObj[rowIndex].Status = event.target.value;
    console.log('value',event.target.value);
}
 else if(event.target.name == 'Date') {
this.recordObj[rowIndex].Date = event.target.value;
console.log('value',event.target.value);
} 
console.log(JSON.stringify(this.recordObj))
}

    handleAdd(){
        console.log('in Handle Add');
        this.recordObj = [...this.recordObj,{Name:'',Status:'',Date:''}];
    }
}