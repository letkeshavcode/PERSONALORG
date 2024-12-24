import { LightningElement } from 'lwc';
import { loadStyle } from 'lightning/platformResourceLoader';
import ORANGE_BACKGROUND from '@salesforce/resourceUrl/orangeBackground';
export default class Progress_tracker extends LightningElement {
   

    data = [
        {
            id: '1',
            product: 'Widget',
            thickness: 5,
            width: 10,
            height: 5,
            length: 20,
            grade: 'A',
            norm: 'ISO',
            tolerance: '+/- 0.1',
            execution: 'Standard',
            instock: true,
            quantity: 100,
            price: 10.99
        },
        // Add more objects to the data array as needed
    ];

    columns = [
        { label: 'Product', fieldName: 'product', cellAttributes: { class: 'orange-bg' } },
        { label: 'Thickness', fieldName: 'thickness', type: 'number' },
        { label: 'Width', fieldName: 'width', type: 'number', cellAttributes: { class: 'orange-bg' } },
        { label: 'Height', fieldName: 'height', type: 'number' },
        { label: 'Length', fieldName: 'length', type: 'number', cellAttributes: { class: 'orange-bg' } },
        { label: 'Grade', fieldName: 'grade' },
        { label: 'Norm', fieldName: 'norm', cellAttributes: { class: 'orange-bg' } },
        { label: 'Tolerance', fieldName: 'tolerance' },
        { label: 'Execution', fieldName: 'execution', cellAttributes: { class: 'orange-bg' } },
        { label: 'In Stock', fieldName: 'instock', type: 'boolean' },
        { label: 'Quantity', fieldName: 'quantity', type: 'number', cellAttributes: { class: 'orange-bg' } },
        { label: 'Price', fieldName: 'price', type: 'currency', typeAttributes: { currencyCode: 'USD' } }
    ];

    connectedCallback() {
        loadStyle(this, ORANGE_BACKGROUND);
    }

    handleRowAction(event) {
        const row = event.detail.row;
        alert(`You clicked ${row.product}`);
    }
}