/**
 * Auto Generated and Deployed by Fast Prefill - Formstack
 **/
trigger FFPrefill_Trigger6BF97 on Lead
    (after insert)
{
 if  (trigger.isAfter  &&  trigger.isInsert) { 
List<Lead>  newlyInsertedItems =  [SELECT  Id ,  Website FROM  Lead WHERE  Id  IN :trigger.new] ; 
List<string> ids = new List<string>();
 for ( Lead e  : newlyInsertedItems) { 
ids.add(e.id); 
} 
 VisualAntidote.FastFormsUtilities.DoUpdateRecords( 'Lead' ,  'Website' ,  'a1A7F000002NrNwUAK' ,  ids,null );  
 update newlyInsertedItems;}
}