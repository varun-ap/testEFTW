({
    
    createShippingAddressTable : function(component,event,helper) {
        // alert("kapil");
        // call the apex class method 
        var action = component.get("c.getShippingAddress");
        // set param to method  
        action.setParams({
            'projectId' : component.get("v.selectedLookUpProjectRecord.Id"),
            'accountId' : component.get("v.selectedLookUpAccountRecord.Id"),
            'contactId' : component.get("v.selectedLookUpContactRecord.Id")
        });
        // set a callBack    
        action.setCallback(this, function(response) {
            
            console.log("response for OC Address",response.getReturnValue());
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
                component.set("v.listOfShippingAddresses", storeResponse);
                
                setTimeout(function(){
                    console.log('iSit a datatable? ',$.fn.dataTable.isDataTable( '#wheretOShip' ));
                    if ( !$.fn.dataTable.isDataTable( '#wheretOShip' ) ) {
                        
                        var table=$('#wheretOShip').DataTable({
                            "lengthMenu": [ [5, 10, 25, -1], [5, 10, 25, "All"] ],
                language: {
    paginate: {
      next: '<i class="glyphicon glyphicon-chevron-right">',
      previous: '<i class="glyphicon glyphicon-chevron-left">'  
    }
  }

    });
                    // add lightning class to search filter field with some bottom margin..  
                    }
                }, 500); 
            }
 
        });
        // enqueue the Action  
        $A.enqueueAction(action);
        
    },
    
    getPhoneNumber : function(component,event,secId) {
        // alert("kapil");
        // call the apex class method 
        var action = component.get("c.getPhoneNumber");
        // set param to method  
        action.setParams({
            'accountId' : component.get("v.selectedLookUpAccountRecord.Id"),
            'contactId' : component.get("v.selectedLookUpContactRecord.Id")
        });
        // set a callBack    
        action.setCallback(this, function(response) {
            $A.util.removeClass(component.find("mySpinner"), "slds-show");
            console.log("response phone number",response.getReturnValue()," contactid ", component.get("v.selectedLookUpContactRecord.Id"));
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
                component.set("v.phoneNumber", storeResponse);
            }
            
        });
        // enqueue the Action  
        $A.enqueueAction(action);
        
    },
    
    getEmail : function(component,event,secId) {
        // alert("kapil");
        // call the apex class method 
        var action = component.get("c.getEmail");
        // set param to method  
        action.setParams({
            'contactId' : component.get("v.selectedLookUpContactRecord.Id")
        });
        // set a callBack    
        action.setCallback(this, function(response) {
            $A.util.removeClass(component.find("mySpinner"), "slds-show");
            console.log("response Email",response.getReturnValue());
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
                component.set("v.email", storeResponse);
            }
            
        });
        // enqueue the Action  
        $A.enqueueAction(action);
        
    },
    
    getDeviceList : function(component,event,secId) {
        // alert("kapil");
        // call the apex class method 
        console.log("inside helper");
        var action = component.get("c.getDeviceList");
        action.setParams({
            'contactId' : component.get("v.selectedLookUpContactRecord.Id")
        });
        action.setCallback(this, function(response) {
            $A.util.removeClass(component.find("mySpinner"), "slds-show");
            console.log("response Device List",response.getReturnValue());
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
                component.set("v.deviceList", storeResponse);
            }
            
        });
        // enqueue the Action  
        $A.enqueueAction(action);
        
    },
    
    getPriorityList : function(component,event,secId) {
        // alert("kapil");
        // call the apex class method 
        console.log("inside helper priority");
        var action = component.get("c.getPriorityList");
        action.setParams({
            'contactId' : component.get("v.selectedLookUpContactRecord.Id")
        });
        action.setCallback(this, function(response) {
            $A.util.removeClass(component.find("mySpinner"), "slds-show");
            console.log("response Device List",response.getReturnValue());
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
                component.set("v.priorityList", storeResponse);
            }
            
        });
        // enqueue the Action  
        $A.enqueueAction(action);
        
    }
    
    
})