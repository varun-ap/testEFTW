({   
    getSingleAccount : function(component, event, helper) {        
        // call the apex class method 
        var action = component.get("c.getRelatedAccount");
        console.log("contact selected", component.get("v.oRecord.Id"));
        // set param to method         
        action.setParams({
            'id' : component.get("v.oRecord.Id")
        });
        console.log("state ");
        // set a callBack         
          action.setCallback(this, function(response) {
              
          $A.util.removeClass(component.find("mySpinner"), "slds-show");
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
               if (storeResponse.length == 0) {
                    component.set("v.Message", 'No Result Found...');
                } else {
                    component.set("v.Message", '');
                }
                console.log("response aaa",response.getReturnValue());
                var getSelectRecord = component.get("v.oRecord");
                // call the event   
                var compEvent = component.getEvent("oSelectedRecordEvent");
                // set the Selected sObject Record to the event attribute.  
                compEvent.setParams({"recordByEvent" : getSelectRecord });  
                // fire the event  
                compEvent.fire();
                // set searchResult list with return value from server.
                
                
                // call the event   
                var compEvent = component.getEvent("oSingleRecordEvent");
                // set the single sObject Record to the event attribute.  
                compEvent.setParams({"singleRelatedRecord" : response.getReturnValue() });  
                // fire the event  
                compEvent.fire();
                
                
            }
 
        });
      
        // enqueue the Action  
        $A.enqueueAction(action);
    }, 
    
    
    
  /*getListHelper : function(component,event,helper) {
        console.log("aaa");
         var action = component.get("c.getRelatedAccount");
      // set param to method  
        action.setParams({
            
            'id' : component.get("v.oRecord.Id")
          });
      // set a callBack    
       console.log("outside");
        action.setCallback(this, function(response) {
          console.log("check ",component.get("v.relatedRecord.Id"),component.get("v.objectAPIName"));
          $A.util.removeClass(component.find("mySpinner"), "slds-show");
            console.log("response fff",component.get("v.relatedRecord.Id"),response.getReturnValue());
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
              // if storeResponse size is equal 0 ,display No Result Found... message on screen.                }
                if (storeResponse.length == 0) {
                    component.set("v.Message", 'No Result Found...');
                } else {
                    component.set("v.Message", '');
                }
                // set searchResult list with return value from server.
                //component.set("v.listOfSearchRecords", storeResponse);
            }
 
        });
      // enqueue the Action  
        $A.enqueueAction(action);
    }*/
})