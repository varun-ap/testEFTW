({
    newCandidate: function(component, event, helper) {
        // Global event force:createRecord is used
        var createContact = $A.get("e.force:createRecord");
        // Parameters like apiName and defaultValues are set
        createContact.setParams({
            "entityApiName": "Candidate__c",
            
        });
        // Event fired and new contact dialog open
        createContact.fire();
    },
    
    editCandidate : function(component, event, helper) {
        var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({
            "recordId": component.get("v.recordId")
        });
        editRecordEvent.fire();
    },
    
    
    handleSelect: function (cmp, event, helper) {
        // This will contain the string of the "value" attribute of the selected
        // lightning:menuItem
        var selectedMenuItemValue = event.getParam("value");
        alert("Menu item selected with value: " + selectedMenuItemValue);
    }
    
    
})