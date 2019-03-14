public class CustomLookUpController {
    //static boolean isProject=false;
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName) {
        system.debug('ObjectName-->' + ObjectName);
        String searchKey = searchKeyWord + '%';
        List < sObject > returnList = new List < sObject > ();
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        String sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey order by createdDate DESC limit 5';
        List < sObject > lstOfRecords = Database.query(sQuery);
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
    @AuraEnabled
    public static List < sObject > fetchList(String searchKeyWord, String ObjectName,String relatedId,String projectId,String accountId,String contactId) {
        system.debug('ObjectName-->' + ObjectName+' accountId '+accountId+' '+' contactId '+contactId+' projectId '+projectId);
        String searchKey = searchKeyWord + '%';
        List < sObject > returnList = new List < sObject > ();
        String sQuery;
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5 
        /*if(String.isNotEmpty(relatedId) && relatedId!=null){
            if(ObjectName.equals(AP_Constants.objectContactName)){  
                sQuery = 'SELECT Name, Id FROM Contact where accountId=:relatedId and Name LIKE: searchKey order by createdDate DESC limit 5';
            }else if(ObjectName.equals(AP_Constants.objectAccountName)){
                if(String.isEmpty(projectId) && projectId==null){
                    System.debug('if '+' '+relatedId);
                    Contact c=[select Id,accountId from contact where Id=:relatedId];
                    String conId=c.accountId;
                    sQuery = 'SELECT Name, Id FROM Account where Id=:conId and Name LIKE: searchKey order by createdDate DESC limit 5';
                } else{
                    System.debug('else '+' '+relatedId);
                    Project__c p = [select Id,Account__c from Project__c where id=:relatedId];
                    String proId=p.Account__c;
                    System.debug('proId: '+proId);
                    sQuery = 'SELECT Name, Id FROM Account where Id=:proId and Name LIKE: searchKey order by createdDate DESC limit 5';
                }
            } else if(ObjectName.equals(AP_Constants.objectProjectName)){ 
                System.debug('Project selected');
                //isProject=true;
                sQuery = 'SELECT Name, Id FROM Project__c where Account__c=:relatedId and Name LIKE: searchKey order by createdDate DESC limit 5';
            }
            
        }*/
        if((String.isNotEmpty(accountId) && accountId!=null)||(String.isNotEmpty(contactId) && contactId!=null)||(String.isNotEmpty(projectId) && projectId!=null)){
            //When Contact field is selected
            if(ObjectName.equals(AP_Constants.objectContactName)){ 
                if((String.isEmpty(accountId) && accountId==null) && (String.isNotEmpty(projectId) && projectId!=null)){
                    Project__c pro = [select Id,Account__c from Project__c where id=:projectId];
                	String occAccount = pro.Account__c;
                	sQuery = 'SELECT Name,Email, Id FROM Contact where accountId=:occAccount and Name LIKE: searchKey order by createdDate DESC limit 5';
                }  else{
                    sQuery = 'SELECT Name,Email, Id FROM Contact where accountId=:accountId and Name LIKE: searchKey order by createdDate DESC limit 5';
                }              	
            }
            //When Project field is selected
            if(ObjectName.equals(AP_Constants.objectProjectName)){ 
                sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey order by createdDate DESC limit 5';
            }
            //When Account field is selected
            if(ObjectName.equals(AP_Constants.objectAccountName)){ 
                if((String.isNotEmpty(contactId) && contactId!=null) && (String.isEmpty(projectId) && projectId==null)){
                    
                    System.debug('contactIdddd '+contactId);
                    Contact c=[select Id,accountId from contact where Id=:contactId];
                    String acc=c.accountId;
                    system.debug('accId '+acc+' contactId'+contactId);
                    sQuery = 'SELECT Name, Id FROM Account where Id=:acc and Name LIKE: searchKey order by createdDate DESC limit 5';
                } else{
                    Project__c pro = [select Id,Account__c from Project__c where id=:projectId];
                	String ocAcc = pro.Account__c;
                    system.debug('accId '+ocAcc+' contactId'+projectId);
                	sQuery = 'SELECT Name, Id FROM Account where Id=:ocAcc and Name LIKE: searchKey order by createdDate DESC limit 5';
                }
            }
        }
        else{            
            System.debug(ObjectName+' selected initially');
            sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey order by createdDate DESC limit 5';
        }
        
        List < sObject > lstOfRecords = Database.query(sQuery);
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        System.debug('squery '+sQuery+' list'+returnList);
        return returnList;
    }
    
    @AuraEnabled
    public static sObject getRelatedAccount( String id) {
        system.debug('ContactId--> ' + id);
        
        List < sObject > returnList = new List < sObject > ();
      
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        String sQuery =  'SELECT id,name,AccountId from contact where id=: id';
        Contact con = Database.query(sQuery);
        String accId=con.AccountId;
        squery = 'SELECT id,name from account where id=: accId';
        Account acc = Database.query(sQuery);
        
        System.debug('Account Sngle: ' + acc);
        
        return acc;
    }
   
}