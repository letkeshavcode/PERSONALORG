import { LightningElement,track, wire } from 'lwc';
import fetchObjects from '@salesforce/apex/FetchObjectsAndFields.fetchObjects';
import fetchFields from '@salesforce/apex/FetchObjectsAndFields.fetchFields';
export default class DynamicsTable extends LightningElement {

    value = '';
   @track comboOptions=[];
    @track fieldNames = [];

   fieldsVisible = false;
    obj ='';

    get options() {
        return [
            { label: 'New', value: 'new' },
            { label: 'In Progress', value: 'inProgress' },
            { label: 'Finished', value: 'finished' },
        ];
    }

    handleChange(event) {
       
    }

    handleChangeSelect(event){
        this.value = event.target.value;
        console.log('value',this.value);
         this.obj = this.value;
         this.fieldsVisible = true;
        
    }

    @wire(fetchObjects)
    objectName({error,data}){
        if(data){
            console.log('data--',data);
            data.forEach(element => {
            this.comboOptions = [...this.comboOptions,element.objName];
           
           });
           
            console.log('dekho comboOptions',this.comboOptions);
        }else if(error){
            console.log('error',error);
        }
    };

    @wire(fetchFields,{obj:'$obj'})fields({error,data}){
        if(data){
            console.log('data feilds',data);
            data.forEach(element=>{
                this.fieldNames = [...this.fieldNames,element.objectName]
            });

        }else if(error){
            console.log('fields nhi aarhi',error);
        }

    };


}