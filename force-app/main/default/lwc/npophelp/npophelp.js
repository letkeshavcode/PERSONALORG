import { LightningElement } from 'lwc';

export default class Npophelp extends LightningElement {
    handleNpop(){
        const modal = this.template.querySelector("c-modal-Popup");
        modal.show();
    }
}