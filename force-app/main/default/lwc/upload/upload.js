import { LightningElement,track,api } from 'lwc';
import getDriveData from '@salesforce/apex/GoogleWebService.getFile';
import createNewFile from '@salesforce/apex/GoogleWebService.createNewFile';
import uploading from '@salesforce/apex/GoogleWebService.uploading';
//import uploadFile from '@salesforce/apex/GoogleWebService.uploadFile';


export default class Upload extends LightningElement {
@track driveData;
@track data;
@track filedata={
    name:'',
    type:''
};

@track filedata;

@track showTable = false;

@track columns = [
{ label: 'id', fieldName: 'id' },
{ label: 'kind', fieldName: 'kind' },
{ label: 'mimeType', fieldName: 'mimeType' },
{ label: 'name', fieldName: 'name' }

];
@api mainfile;


handleNameChange(event){
    this.filedata.name= event.target.value;
    console.log('name',event.target.value);
}
handleTypeChange(event){
    this.filedata.type = event.target.value;
    console.log('type',event.target.value);
}
handleCreate(){
      createNewFile({name:this.filedata.name,type:this.filedata.name}).then(result=>{
            console.log('created file',JSON.parse(result));
            window.alert(result);
            
        }).catch(error=>{
            console.log('error',error);
        });
    
}

handleShowData(event){
    console.log('clicked');
    getDriveData({ fileId: '' })
    .then(result => {
        // console.log('clicked', result);
        console.log('result',JSON.parse(result));
        this.driveData = JSON.parse(result);
        //console.log('type of file',this.driveData.files[3].kind );
        this.data = JSON.parse(result);
        console.log('data',this.data.files);
        // console.log('data2',this.data.files[0]);
        this.data = this.data.files;
        this.showTable = true;
        // console.log('this.data',this.data[0]);
        // this.data =this.data.files;
        ///console.log('drive data',this.driveData);
        //onsole.log('type fof file',this.driveData[0].name)
    })
    .catch(error => {
        this.error = error;
    });

}
@track typeoffile;
@track filesUploaded = [];
openfileUpload(event){
 if (event.target.files.length > 0) {
        let files = [];
        for(var i=0; i< event.target.files.length; i++){
            let file = event.target.files[i];
            let reader = new FileReader();
            reader.onload = e => {
                let base64 = 'base64,';
                let content = reader.result.indexOf(base64) + base64.length;
                let fileContents = reader.result.substring(content);
                this.filesUploaded.push({PathOnClient: file.name, Title: file.name, VersionData: fileContents});
                console.log('versiondata',fileContents);
            };
            reader.readAsDataURL(file);
            
        }
    }

//     console.log('event',event.target.files);
//     this.mainfile = event.target.files;
//     const file = event.target.files[0];
//   //  this.files = [...this.files,JSON.stringify(event.target.files[0])];
    
//     console.log('file poori',event.target.files[0]);
//     console.log('files--',event.target.files[0].type);
//     this.typeoffile = event.target.files[0].type;
//    // this.type = file.type;
//    // console.log('file object',this.file);
//         var reader = new FileReader()
//         reader.onload = () => {
//             var base64 = reader.result.split(',')[1]
//              this.fileData = {
//                 'filename': file.name,
//                 'base64': base64,
//                 'recordId': this.recordId
//             }
//             //console.log(this.fileData)
//             //console.log(this.fileData.base64);
//             //console.log('result',reader.result);
//         }
//         reader.readAsDataURL(file)
}

handleClick(){
    console.log('files',this.filesUploaded);
    uploading({files: this.filesUploaded})
    .then(result => {
       console.log('shi h');
       console.log('result',result);
    })
    .catch(error => {
       console.log('bekar h',error);
    });

    // console.log('this.files---',this.mainfile);
    // uploading({mainfile:this.mainfile}).then(result=>{
    //     console.log('shi h');
    // }).catch(error=>{
    //     console.log('bekar h');
    // });

//    const {base64, filename, recordId} = this.fileData;
//     uploadFile({filetype: this.typeoffile , filename : this.fileData.filename, base64 : this.fileData.base64, recordId:this.fileData.recordId }).then(result=>{
//         this.fileData = null
//         console.log('success',JSON.stringify(result));
//         //let title = `${filename} uploaded successfully!!`
//         //this.toast(title)
//     }).catch(error=>{
//         console.log('error',error);
//     })
}


// @track page = 1;
// @track startingRecord = 1;//start record position per page
// @track endingRecord = 0; //end record position per page
// @track pageSize = 5; //default value we are assigning
// @track totalRecountCount = 0;//total record count received from all retrieved records
// @track totalPage = 0;//total number of page is needed to display all records

//     nextHandler() {
//         console.log('in next');
//         if((this.page<this.totalPage) && this.page !== this.totalPage){
//             this.page = this.page + 1; //increase page by 1
//             this.displayRecordPerPage(this.page);
//         }
//     }
//     FirstHandler(){
//         this.page=1;
//         this.displayRecordPerPage(this.page);
//     }
//     LastHandler(){
//         this.page=this.totalPage;
//         this.displayRecordPerPage(this.page);
//     }

//     displayRecordPerPage(page){
    
//         this.startingRecord = ((page -1) * this.pageSize) ;
//         this.endingRecord = (this.pageSize * page);
        
//             this.endingRecord = (this.endingRecord > this.totalRecountCount) 
//                 ? this.totalRecountCount : this.endingRecord; 
        
//         this.data = this.data.slice(this.startingRecord, this.endingRecord);
        
//         this.startingRecord = this.startingRecord + 1;
//     }

//     previousHandler() {
//         if (this.page > 1) {
//         this.page = this.page - 1; //decrease page by 1
//         this.displayRecordPerPage(this.page);
//         }
//     }

}