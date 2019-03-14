public class ContactSearch {

    public static List<Contact> searchForContacts (String s1,String s2){
        List<Contact> con=[Select Id,Name from Contact where LastName =:s1 AND MailingPostalCode =:s2];
        
        return con; 
    }
}