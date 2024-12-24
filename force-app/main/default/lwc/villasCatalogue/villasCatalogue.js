import { LightningElement,track } from 'lwc';
import { loadStyle } from "lightning/platformResourceLoader";
import myResource from '@salesforce/resourceUrl/villaImages';
import interior from '@salesforce/resourceUrl/interior';
import myCSS from '@salesforce/resourceUrl/catalogueCSS';
export default class VillasCatalogue extends LightningElement {
image1 = myResource + '/building2.jpg';
image2 = myResource +'/villa2.jpg'
image3= myResource+'/villa3.jpg';

bimage1 = myResource + '/building2.jpg';
bimage2 =  myResource + '/building3.jpg';
bimage3 =  myResource +'/building6.jpg';
bimage4 =   myResource + '/building5.jpg';
bimage5 = myResource + '/building6.jpg';
bimage6 = myResource + '/villa1.jpg';
bimage7 = myResource + '/villa2.jpg';
bimage8 = myResource + '/villa1.jpg';
bimage9 = myResource + '/villa3.jpg';


int1 = interior + '/i1.jpg';
int2 = interior + '/i2.jpg';
int3 = interior + '/i3.jpg';
int4 = interior + '/i4.jpg';
int5 = interior + '/i5.jpg';
int6 = interior + '/i6.jpg';
int7 = interior + '/i7.jpg';

@track mainPage = true;

 @track p1 = false;
 @track p2 = false;
 @track p3= false;
 @track p4=false;
 @track p5=false;
 @track p6= false;
 @track p7 = false;
 @track p8 = false;
 @track p9= false;

connectedCallback() {
    loadStyle(this, myCSS);
  }

  handlelink(event){
  
    this.mainPage = false;
    console.log('event---',event.target.name);
    let name = event.target.name;
    switch(name){
        case 'pic1' : this.p1 = true; 
        this.p2 = false;
        this.p3= false;
        this.p4=false;
        this.p5=false;
        this.p6= false;
        this.p7 = false;
        this.p8 = false;
        this.p9= false;
        case 'pic2' :this.p2 = true;
        this.p1 = false;
        this.p3= false;
        this.p4=false;
        this.p5=false;
        this.p6= false;
        this.p7 = false;
        this.p8 = false;
        this.p9= false;
        case 'pic3' :this.p3 = true;
        this.p2 = false;
        this.p1= false;
        this.p4=false;
        this.p5=false;
        this.p6= false;
        this.p7 = false;
        this.p8 = false;
        this.p9= false;
        case 'pic4' :this.p4 = true;
        this.p2 = false;
        this.p3= false;
        this.p1=false;
        this.p5=false;
        this.p6= false;
        this.p7 = false;
        this.p8 = false;
        this.p9= false;
        case 'pic5' :this.p5 = true;
        this.p2 = false;
        this.p3= false;
        this.p4=false;
        this.p1=false;
        this.p6= false;
        this.p7 = false;
        this.p8 = false;
        this.p9= false;
        case 'pic6' :this.p6 = true;
        this.p2 = false;
        this.p3= false;
        this.p4=false;
        this.p5=false;
        this.p1= false;
        this.p7 = false;
        this.p8 = false;
        this.p9= false;
        case 'pic7' :this.p7 = true;
        this.p2 = false;
        this.p3= false;
        this.p4=false;
        this.p5=false;
        this.p6= false;
        this.p1 = false;
        this.p8 = false;
        this.p9= false;
        case 'pic8' :this.p8 = true;
        this.p2 = false;
        this.p3= false;
        this.p4=false;
        this.p5=false;
        this.p6= false;
        this.p7 = false;
        this.p1 = false;
        this.p9= false;
        case 'pic9' :this.p9 = true;
        this.p2 = false;
        this.p3= false;
        this.p4=false;
        this.p5=false;
        this.p6= false;
        this.p7 = false;
        this.p8 = false;
        this.p1= false;

    }



  }





}