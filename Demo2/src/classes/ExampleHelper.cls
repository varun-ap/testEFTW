public class ExampleHelper implements Queueable,Database.AllowsCallouts {
    
    //@future(callout=true)
    public void execute(QueueableContext context){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://www.mocky.io/v2/5b753d0e2e00006300535f68');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        List<Account> lstAccount = new list<Account>();
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            
            //Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> results = (List<Object>) JSON.deserializeUntyped(response.getBody());
            System.debug(results);
            //String name=null;
            for(Object result:results){
                Map<String, Object> obj= (Map<String, Object>) result;
                //system.debug('Name:' + obj.get('Name'));
                Account acc = new Account();
                acc.Name=(String)obj.get('Name');
                lstAccount.add(acc);
            }
            if(!lstAccount.isEmpty())
            {
                insert lstAccount ;
            }            
        }
    }
}