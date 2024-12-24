import { LightningElement,track,wire,api } from 'lwc';
import getLinkedInData from '@salesforce/apex/GoogleSheetIntegration.linkedinIntegration';
import postLinkedin from '@salesforce/apex/GoogleSheetIntegration.postLinkedin';
import { CurrentPageReference } from 'lightning/navigation';
//mport doGetAccessToken from '@salesforce/apex/GoogleSheetIntegration.doGetAccessToken';
export default class LinkedInIntegration extends LightningElement {
   
   user_record;
   id;
    urlId = null;
    urlLanguage = null;
    urlType = null;
    currentPageReference = null; 
    urlStateParameters = null;
   @track text;
   @api recordId;
    connectedCallback(){
        
    console.log('in connected callback of linkedin integration');
    this.getData();
   }

   @wire(CurrentPageReference)
   getStateParameters(currentPageReference) {
      if (currentPageReference) {
         this.urlId = currentPageReference.state?.id;
         this.urlLanguage = currentPageReference.state?.lang;
         this.urlType = currentPageReference.state?.type;

         this.recordId = currentPageReference.attributes.recordId || null;

         console.log('RECORD ID ++ '+this.recordId);
         console.log('currentPageReference == '+JSON.stringify(currentPageReference));
         console.log('1 == '+this.urlId);
         console.log('2 == '+this.urlLanguage);
         console.log('3 == '+this.urlType);
      }
   }
   
    getData(){
        getLinkedInData().then((result)=>{
            console.log('linkedin result',result);
            this.user_record = result;
            console.log('user id',this.user_record);
            this.id = this.user_record.id;
            
        }).catch((error)=>{
            console.log('error in linkedin integration',error);
        });
    }
    // GetAccessToken(){
    //     doGetAccessToken().then(result=>{
    //         console.log('access token');
    //     }).catch(error=>{
    //         console.log('error',error);
    //     });
    // }
    handlePost(){
        this.id=this.id;
        console.log('this.id',this.id);
        postLinkedin({userId:JSON.stringify(this.id),text:this.text}).then(result=>{
            console.log('posted data on linekdin successfully');
        }).catch(error=>{
            console.log('error',error);
        });
    }

    handleMessage(event){
        console.log('text area input',event.detail.value);
        this.text = event.detail.value;
    }
}