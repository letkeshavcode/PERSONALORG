trigger priceDiscountTrigger on Book__c (before insert,after update,after insert) {
    if(trigger.isInsert && trigger.isAfter ){
        System.debug('trigger to cha rha h');
        priceDiscountTriggerHelper.updateDiscount(trigger.New);
    }
    if(trigger.isUpdate && trigger.isAfter){
        priceDiscountTriggerHelper.updateDiscountOnChange(trigger.oldmap,trigger.newmap,trigger.New);
    }
}