({
   addItem: function(component, item) {
    this.saveItem(component, item, function(response){
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            // all good, nothing to do.
            var items = component.get("v.items");
            items.push(response.getReturnValue());
            component.set("v.items", items);
             component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c',
                    'Name': '',
                    'Quantity__c': 0,
                    'Price__c': 0,
                    'Packed__c': false });
        }
        
    });
},
})