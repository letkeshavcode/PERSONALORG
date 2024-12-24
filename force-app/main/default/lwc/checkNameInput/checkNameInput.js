import { LightningElement } from 'lwc';

export default class CheckNameInput extends LightningElement {
    nameInput='';

    handleNameInputChange(event){
        this.nameInput = event.target.value;
        console.log('this.nameinput',this.nameInput);
    }
    handleClick(event){
        console.log('clicked');
        const regex = /[\r\n \n\t .:;?!~,&|()<>{}]/ ;
        let string = this.nameInput;
       // let myArray = string.split(/[ .:;?!~,&|()<>{}]/);
    //    string.replace(regex,"");
    //     console.log('myarray',string.split(regex));
        const myArray = string.split(regex);
        var result='';
        myArray.forEach(element =>{
            if(element.length!=0){
                result+=element +" ";
            }
        }
           
        );
        console.log('reslt',result);

    }
}