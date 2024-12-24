import { LightningElement,api } from 'lwc';

export default class LeadConvertPop extends LightningElement {
    @api viewPop = false;

  @api show() {
    this.viewPop = true;
  }

  handleDialogClose() {
    this.viewPop = false;
  }
}