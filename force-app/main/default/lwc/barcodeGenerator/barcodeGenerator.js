import { LightningElement } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';
import barcode from "@salesforce/resourceUrl/barcode";

export default class BarcodeGenerator extends LightningElement {



    connectedCallback() {
        Promise.all([
            loadScript(this, barcode)
        ]).then(() =>{
            this.renderButtons();
        }).catch(error => {
            window.console.log("Error " + error.body.message);
        });
    }
    renderButtons(){
        this.boolShowSpinner = false;
    }
    generateBarcode(){
        const canvas = this.template.querySelector('[data-id="barcode"]');  
        JsBarcode(canvas, "CODE39 Barcode", {
            format: "CODE39"
          });        
        JsBarcode(".barcode").init(); 
    }  
}