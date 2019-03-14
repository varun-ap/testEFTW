public class AccountHandler {
    public static Account insertNewAccount (String s){
        try{
            
            Account acct=new Account(Name=s);
        	insert acct;        	
            return acct;
        }
        catch(DmlException e){
            return null;
        }
        
    }
}