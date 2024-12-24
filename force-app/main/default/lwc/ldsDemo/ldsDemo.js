import { LightningElement } from 'lwc';

export default class LdsDemo extends LightningElement {

    handleError(){
        alert('Error occurred');
    }

    handleSuccess(){
        alert('Record Created');
    }

    handleSubmit(){
        alert('Form Submitted');
    }


}