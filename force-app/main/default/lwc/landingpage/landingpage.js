import { LightningElement,wire,api,track} from 'lwc';
import getCategoryInfo from '@salesforce/apex/landingPage.getCategoryInfo';

export default class Landingpage extends LightningElement {
@track categoryinfo=[];
    @wire(getCategoryInfo)
    wiredCategory({ error, data }){
        if(data){
            this.categoryinfo = data;
            console.log('data',data);
            console.log('categoryinfo',JSON.stringify(this.categoryinfo));
        }else{
            console.log('error',error);
        }
    }


}