@isTest
public class TestRestrictContactByName {
    @isTest static void checkTrigger(){
        
        
        Contact c=new Contact(LastName='INVALIDNAME');
        Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
        
        Test.stopTest();
        
    }
}