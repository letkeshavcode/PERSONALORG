import { LightningElement,wire,track,api } from 'lwc';
import getData from '@salesforce/apex/GoogleSheetIntegration.googleSheetsConnect';
export default class Googlesheets extends LightningElement {
    final_result;
    columns=[];
    data= [];
    connectedCallback(){
       // console.log('in connected callback');
       // this.getSpreadSheetData();
        
    }
    
    
    getSpreadSheetData(){
        getData().then(result=>{
            console.log('method called properly');
             console.log('result',result);
             this.final_result = JSON.parse(JSON.stringify(result));
             console.log('values',this.final_result.values);
             this.final_result.values[0].forEach(element => {
                //console.log('element',element);
                this.columns.push({label:element+'',fieldName:element+''});
             });
            
             for(let i=1;i<this.final_result.values.length;i++){
               let obj = {};
               obj.Name = this.final_result.values[i][0];
               obj.RollNo = this.final_result.values[i][1];
               obj.Subject = this.final_result.values[i][2];
               this.data.push(obj);
                console.log(' row changed from here')
             }
             console.log('columns',this.columns);
             console.log('data',this.data);
             this.data = JSON.parse(JSON.stringify(this.data));
             this.columns = JSON.parse(JSON.stringify(this.columns));
           //console.log('result',JSON.parse(JSON.stringify(result)));
        }).catch(error=>{
            console.log('error',error);
        });
    }
}