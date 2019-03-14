public class NewCaseListController {
    public List<Case> getNewCases(){
        
        List<Case> c=[SELECT Id,CaseNumber  FROM Case WHERE status='New'];
        return c;
        
    }
}