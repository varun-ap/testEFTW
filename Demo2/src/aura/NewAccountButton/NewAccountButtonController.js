({
	newContact: function(component, event, helper) {
        // Global event force:createRecord is used
        var createContact = $A.get("e.force:createRecord");
        // Parameters like apiName and defaultValues are set
        createContact.setParams({
            "entityApiName": "Contact"
            
        });
        // Event fired and new contact dialog open
        createContact.fire();
    }
})