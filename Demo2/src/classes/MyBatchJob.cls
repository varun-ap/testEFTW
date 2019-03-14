global class MyBatchJob implements Database.Batchable<sObject>{

    global final string query;

        //Example query, obviously Im sure you might even use another object
    global MyBatchJob(){
        System.debug('test my batch');
        query = 'Select Id, Name From Contact';     
    } 

    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC,List<sObject> scope) {
        List<TestSchedule__c> objs = new List<TestSchedule__c>();
		Integer i=0;
        //Assuming the snapshots you want are of Contact data
        for(Sobject s : scope){
            Contact c = (Contact) s;
            objs.add(new TestSchedule__c ( //Populate your Custom Object with data from the Contact
                							 Name=c.Name)
                    );
        } 
        insert objs; 
   }

   global void finish(Database.BatchableContext BC) {
        System.debug(LoggingLevel.WARN,'Batch Job is Complete!!!!!');
   }

}