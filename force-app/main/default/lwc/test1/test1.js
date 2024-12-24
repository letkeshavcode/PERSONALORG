import { LightningElement } from 'lwc';

export default class Test1 extends LightningElement {

Name = 'Keshav';
fn;
ln;
    myfunction(){
    let fn = document.getElementsById("fname");
        let ln = document.getElementsById("lname");
        console.log(fn + " " + ln);
    }

    submitfn(){
        
    }

    handleFirstNameChange(event) {
        this.fn = event.target.value;
        window.console.log(fn);
        
    }
    handleLastNameChange(event) {
        this.ln = event.target.value;
        window.console.log(ln);
        
     }

     
}