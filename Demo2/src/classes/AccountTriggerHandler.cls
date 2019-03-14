public class AccountTriggerHandler {

    public static void CreateAccounts (List<Account> acc){
        
        ///demo
        for (Account a : acc) {
            
            if(a.ShippingState!=a.BillingState)
            {
                a.ShippingState = a.BillingState; // you need to update ShippingState    
            }

        }
        
    }
}