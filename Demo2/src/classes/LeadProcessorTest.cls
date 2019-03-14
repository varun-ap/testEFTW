@isTest 
public class LeadProcessorTest 
{
    static testMethod void test() 
    {
        List<Lead> leads = new List<Lead>();
        for(Integer i=0 ;i <200;i++)
        {
            Lead lead = new Lead();
            lead.FirstName ='FirstName'+i;
            lead.LastName ='LastName'+i;
            lead.Company ='demo'+i;
            leads.add(lead);
        }
        
        insert leads;
        
        Test.startTest();
            LeadProcessor obj = new LeadProcessor();
            DataBase.executeBatch(obj); 
        Test.stopTest();
    }
}