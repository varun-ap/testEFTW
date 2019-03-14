/*public with sharing class AngularWithVfPage {
  
        
 public static String getContacts() {
       return JSON.serialize([select id, name, email
           from contact ]);
   }
}*/

global with sharing class AngularWithVfPage {
   // hardcode an account id for demo purposes
   static String accountId = '0017F00000oL5XfQAK';
 
   global static String getAccount() {
       return JSON.serialize([select name, billingstreet,
           billingcity, billingstate, billingpostalcode
           from account where id = :accountId][0]);
   }    
 
   global static String getContacts() {
       return JSON.serialize([select name
           from account]);
   }
}