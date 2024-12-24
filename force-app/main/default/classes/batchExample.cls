global class batchExample implements Database.Batchable<sObject> {
    /**
        * Webkul Software.
        *
        * @category  Webkul
        * @author    Webkul
        * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
		* @license   https://store.webkul.com/license.html
	*/
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        
        String query = 'SELECT Id,Name FROM Account';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList) {
       
        // process each batch of records

        
        for(Account acc : accList)
        {        
           	// Update the Account Name 
            acc.Name = acc.Name + 'Webkul';
            
        }
        try {
        	// Update the Account Record
        	System.debug('Done');
            update accList;
        
        } catch(Exception e) {
            System.debug(e);
        }
        
    }   
    
    global void finish(Database.BatchableContext BC) {
    	System.debug('Done');
  }
}