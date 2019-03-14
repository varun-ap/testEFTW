public class CustomLookupResultController {
	@AuraEnabled
    public static List<SObject> getContactsByAccount(Id accountId){
        List<SObject> contacts = new List<SObject>();
        if(accountId != null) {
           // String query = 'SELECT Name, Id FROM '+entityType ;
            //contacts = database.query(query);
            System.debug('inside getcOntacts');
        }
        return contacts;
    }

}