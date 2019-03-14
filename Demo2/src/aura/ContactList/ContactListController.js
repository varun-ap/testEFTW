({
    // Function called on initial page loading to get contact list from server
        getContactsList : function(component, event, helper) {
        // Helper function - fetchContacts called for interaction with server
                helper.fetchContacts(component, event, helper);
        },

    // Function used to create a new Contact
    newContact: function(component, event, helper) {
        // Global event force:createRecord is used
        var createContact = $A.get("e.force:createRecord");
        // Parameters like apiName and defaultValues are set
        createContact.setParams({
            "entityApiName": "Contact",
            "defaultFieldValues": {
                "AccountId": component.get("v.recordId")
            }
        });
        // Event fired and new contact dialog open
        createContact.fire();
    },

    // Function used to update the contacts
    editContacts: function(component, event, helper) {
        // Getting the button element
        var btn = event.getSource();
        // Getting the value in the name attribute
        var name = btn.get('v.name');
        // Getting the record view form and the record edit form elements
        var recordViewForm = component.find('recordViewForm');
        var recordEditForm = component.find('recordEditForm'); 
        // If button is edit
        if(name=='edit') {
            // Hiding the recordView Form and making the recordEdit form visible
            $A.util.addClass(recordViewForm,'formHide');
            $A.util.removeClass(recordEditForm,'formHide');
            // Changing the button name and label
            btn.set('v.name','save');
            btn.set('v.label','Save');
        }
        else if(name=='save') {
            // Calling saveContacts if the button is save
            helper.saveContacts(component, event, helper);
        }
    },
    
    // Function used to delete the contacts
    deleteContacts: function(component, event, helper) {
        // Calling removeContacts Helper Function
        helper.removeContacts(component, event, helper);
    },

    // Function used to open the contact modal
    openModal: function(component, event, helper) {
        var modal = component.find("contactModal");
        var modalBackdrop = component.find("contactModalBackdrop");
        $A.util.addClass(modal,"slds-fade-in-open");
        $A.util.addClass(modalBackdrop,"slds-backdrop_open");
    },

    // Function used to close the contact modal
    closeModal: function(component, event, helper) {
        var modal = component.find("contactModal");
        var modalBackdrop = component.find("contactModalBackdrop");
        $A.util.removeClass(modal,"slds-fade-in-open");
        $A.util.removeClass(modalBackdrop,"slds-backdrop_open");
    },

    // Function used to create new contact
    createContact: function(component, event, helper) {
        helper.insertContact(component, event, helper);
    }
})