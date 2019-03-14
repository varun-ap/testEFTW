public class PlatformDataUpload {
    
    public static List<String> insertData(String results){
        List<String> alpha = results.split(',');   
        //System.debug('1: '+alpha);
        List<List<String>> csvData=new List<List<String>>();
        List<String> row = new List<String>();
        List<Account> lstAccount = new list<Account>();
        for(String s:alpha){
            //System.debug(s);
            List<String> temp = s.split('"');
            if(temp.size()>2){
                row.add(temp.get(1));
                csvData.add(row);
                row=new List<String>();
                row.add(temp.get(3));
            }
            else
                row.add(temp.get(1));
        }
        csvData.add(row);
        System.debug('1: '+csvData);
        for(Integer i = 1; i < csvData.size(); i++){
            Account acc=new Account();
            acc.Name=csvData.get(i).get(0);
            acc.Phone=csvData.get(i).get(1);
            
            lstAccount.add(acc);
        }
        List<String> errors = new List<String>();
        Database.SaveResult[] saveResultList = Database.insert(lstAccount, false);
        Integer i=0;
        for (Database.SaveResult sr : saveResultList) {
            if (!sr.isSuccess()) {
                // Operation failed, so get all errors                
                for(Database.Error err : sr.getErrors()) {
                    //System.debug('The following error has occurred.');                    
                    errors.add(err.getStatusCode() + ': ' + err.getMessage()+'*** Error in row '+(i+1));
                        i=i+1;
                    //System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
            i=i+1;
        }
        System.debug('2: '+errors);
        return errors;
    }
    
    public List<String> csvUploader (String url){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        List<String> s=new List<String>();
        HttpResponse response = http.send(request);
        //List<Account> lstAccount = new list<Account>();
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            String results = response.getBody();
            s = PlatformDataUpload.insertData(results);
            //System.debug(results);
            return s;
            
        }
        else {
            s.add('Response status code not equal to 200');
            
        }
        return s;
        
    }
}