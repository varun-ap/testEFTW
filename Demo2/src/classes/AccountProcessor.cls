public class AccountProcessor {
    @future
    public static void countContacts (List<Id> recordIds){
        for(Id accountId : recordIds){
            List<Contact> contacts = [Select AccountId from Contact Where AccountId =:accountId];
            Account acc = [SELECT Id,Number_of_Contacts__c from Account where Id=: accountId];  
            acc.Number_of_Contacts__c = contacts.size();
            update acc;
        }
    }
}