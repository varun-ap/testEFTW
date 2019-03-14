public class ExampleQueueable implements Queueable, Database.AllowsCallouts {

    public void execute(QueueableContext context) {
        ExampleHelper.makeWebserviceCallout();
    }

}