public class ScheduleTest implements Schedulable, Database.AllowsCallouts, Database.Batchable<sObject> {
    
    public void execute(SchedulableContext SC) {
        Database.executebatch(new ScheduleTest());
    }
    
    public Iterable<sObject> start(Database.Batchablecontext BC){
        System.enqueueJob(new ExampleHelper());
        
        
        return null;
    }
    
    public void execute(Database.BatchableContext BC, List<sObject> scope){  
        
    }
    
    public void finish(Database.BatchableContext info){
        
    }
    
}

/*
 * ScheduleTest st = new ScheduleTest();
String sch=  '0 20 18 16 8 ?';
String jobId=System.schedule('Test Schedule', sch, st);

*/