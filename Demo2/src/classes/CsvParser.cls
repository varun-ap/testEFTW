public class CsvParser {
    /*
*  Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://codehs.com/techstart/csv?secret=pOZPHxiYCHm59lR0ndGJfSLEf0eLpEF6');
request.setMethod('GET');
HttpResponse response = http.send(request);
List<Account> lstAccount = new list<Account>();
// If the request is successful, parse the JSON response.
if (response.getStatusCode() == 200) {

//Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
String results = response.getBody();
List<String> alpha = results.split(',');
//System.debug(alpha.size());
List<String> row = new List<String>();
List<List<String>> csvData = new List<List<String>>();
for(String s:alpha){

if(s.contains('<br>')){          

List<String> j=s.split('"'); 
if(j.size()>1)
{
//System.debug(j);
if(csvData.size()==0){
row.add(j.get(1));
csvData.add(row);
row=new List<String>();
row.add(j.get(3));
}
else{
row.remove(1);
csvData.add(row);
row=new List<String>();
row.add(j.get(1));
}
}
else if(j.size()==1){
row.remove(1);
csvData.add(row);
}

}        
row.add(s);        
}
System.debug(csvData);    
}
*/
    
    /*
* Get error list
* Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('http://www.mocky.io/v2/5b76ae323000006200848c32');
request.setMethod('GET');
HttpResponse response = http.send(request);
List<Account> lstAccount = new list<Account>();
// If the request is successful, parse the JSON response.
if (response.getStatusCode() == 200) {
String results = response.getBody();
List<String> alpha = results.split(',');
List<List<String>> csvData=new List<List<String>>();
List<String> row = new List<String>();
List<Account> lstAccount = new list<Account>();
for(String s:alpha){
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
System.debug(csvData);

for(Integer i = 1; i < csvData.size(); i++){
Account acc=new Account();
acc.Name=csvData.get(i).get(0);
acc.Phone=csvData.get(i).get(1);

lstAccount.add(acc);
}
Database.SaveResult[] saveResultList = Database.insert(lstAccount, false);
for (Database.SaveResult sr : saveResultList) {
if (sr.isSuccess()) {
// Operation was successful, so get the ID of the record that was processed
System.debug('Successfully inserted account. Account ID: ' + sr.getId());
}
else {
// Operation failed, so get all errors                
for(Database.Error err : sr.getErrors()) {
//System.debug('The following error has occurred.');                    
System.debug(err.getStatusCode() + ': ' + err.getMessage());
//System.debug('Account fields that affected this error: ' + err.getFields());
}
}
}
}
*/
    
}