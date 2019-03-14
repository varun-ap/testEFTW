global class ScheduledBatchJob implements Schedulable{

    public static String schedule = '0 25 35 * * ?';  //Every Day at Midnight 

    /*global static String scheduleThisJob() {
        ScheduledBatchJob SBJ = new ScheduledBatchJob(); 
        return System.schedule('Your Job Name', schedule, SBJ);
    }*/

    global void execute(SchedulableContext sc) {

        MyBatchJob Batch = new MyBatchJob();
        System.debug('vb vb test');
        ID batchprocessid = Database.executeBatch(Batch,100);           
    }
}