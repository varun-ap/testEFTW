/**
 * Auto Generated and Deployed by Fast Prefill - Formstack
 **/
trigger FFPrefill_Trigger3E7F6 on Account
    (after insert)
{
 if  (trigger.isAfter  &&  trigger.isInsert) { 
List<Account>  newlyInsertedItems =  [SELECT  Id ,  Website FROM  Account WHERE  Id  IN :trigger.new] ; 
List<string> ids = new List<string>();
 for ( Account e  : newlyInsertedItems) { 
ids.add(e.id); 
} 
 VisualAntidote.FastFormsUtilities.DoUpdateRecords( 'Account' ,  'Website' ,  'a1A7F000002bINlUAM' ,  ids,null );  
 update newlyInsertedItems;}
}