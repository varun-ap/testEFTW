public class AccountUtils {

    public static List<Account> accountsByState (String s1){
        
        List<Account> acc=[SELECT Id, Name from Account where BillingState =:s1];
        return acc;
    }
}