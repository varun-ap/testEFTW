public class ContactAndLeadSearch {

    public static List<List< SObject>> searchContactsAndLeads (String s1){
        List<List<sObject>> searchList = [FIND :s1 IN NAME FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        return searchList;
    }
}