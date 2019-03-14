public class RelatedLookupController {
@AuraEnabled
    public static List < sObject > getShippingAddress(String projectId, String accountId, String contactId) {
       
        System.debug('getShippingAddress apex projectId '+projectId+' accountId '+accountId+' contactId '+contactId);
        List < sObject > returnList = new List < sObject > ();
      
        // Create a Dynamic SOQL Query For Fetch shipping Address with LIMIT 5   
        String sQuery;
        if((String.isEmpty(accountId) && accountId==null) && (String.isNotEmpty(contactId) && contactId!=null)){
            sQuery =  'select OC_Address__c , Account__c, Contact__c  from OC_Address__c  where Contact__c=: contactId';        
        } else if((String.isEmpty(contactId) && contactId==null) && (String.isNotEmpty(accountId) && accountId!=null)){
            sQuery =  'select OC_Address__c , Account__c, Contact__c  from OC_Address__c  where Account__c=: accountId'; 
        }else{
            sQuery =  'select OC_Address__c , Account__c, Contact__c  from OC_Address__c  where (Account__c=: accountId OR Contact__c=: contactId)';
        }
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        
        System.debug('listaddress '+returnList);
        return returnList;
    }
    
@AuraEnabled   
    public static List<String> getPhoneNumber(String accountId, String contactId) {
       
        System.debug(' accountId '+accountId+' contactId '+contactId);
        List < sObject > returnList = new List < sObject > ();
      	String sQuery;
        // Create a Dynamic SOQL Query For Fetch shipping Address with LIMIT 5   
            if((String.isNotEmpty(contactId) && contactId!=null)){
                sQuery =  'select Phone , MobilePhone from contact  where id=: contactId Limit 1';     
                Contact contactPhone = Database.query(sQuery);
                if(contactPhone.MobilePhone != null ){
                    return new List<String>{'Contact','MobilePhone',String.valueOf(contactPhone.MobilePhone)};
                        }else if(contactPhone.Phone != null ){
                            return new List<String>{'Contact','Phone',String.valueOf(contactPhone.Phone)};
                                }
                
            } 
        sQuery =  'select Phone  from account  where id=: accountId Limit 1';
        Account accountPhone = Database.query(sQuery);
        
        return new List<String>{'Account','MobilePhone',String.valueOf(accountPhone.Phone)};
            
    }
    
@AuraEnabled   
    public static String getEmail(String contactId) {
        
        System.debug(' contactId '+contactId);
        List < sObject > returnList = new List < sObject > ();
        
        // Create a Dynamic SOQL Query For Fetch shipping Address with LIMIT 5   
        String sQuery =  'select Email from contact  where id=: contactId Limit 1';         
        Contact contactEmail = Database.query(sQuery);
        
        return String.valueOf(contactEmail.Email);
        
    }
    
@AuraEnabled 
    public static List<String> getDeviceList(String contactId){
        System.debug('In apex ');
       List<String> pickListValuesList= new List<String>();
		Schema.DescribeFieldResult fieldResult = Hardware_Request__c.Device__c.getDescribe();
		List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
		for( Schema.PicklistEntry pickListVal : ple){
			pickListValuesList.add(pickListVal.getLabel());
		}     
		return pickListValuesList;
    }
    
@AuraEnabled 
    public static List<String> getPriorityList(String contactId){
       System.debug('In apex ');
       List<String> pickListValuesList= new List<String>();
		Schema.DescribeFieldResult fieldResult = Hardware_Request__c.Priority__c.getDescribe();
		List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
		for( Schema.PicklistEntry pickListVal : ple){
            if(pickListVal.getLabel().equalsIgnoreCase('High')){
                pickListValuesList.add(0,pickListVal.getLabel());
            } else{
                pickListValuesList.add(pickListVal.getLabel());
            }                
			
		}     
		return pickListValuesList;
    }
    @AuraEnabled
    public static sObject getAccount( String accid) {
        System.debug('in apex get account '+accid);
        String squery = 'SELECT id,name from account where id=: accId';
        Account acc = Database.query(sQuery);
        return acc;
    }
}