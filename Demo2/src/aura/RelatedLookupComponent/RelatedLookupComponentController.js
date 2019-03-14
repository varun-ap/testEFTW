({
    
    sectionOne : function(component, event, helper) {
       helper.helperFun(component,event,'articleOne');
    },
    
    sectionTwo : function(component, event, helper) {
          
        if((component.get("v.selectedLookUpContactRecord").Id != undefined) || (component.get("v.selectedLookUpAccountRecord").Id != undefined)){
            helper.createShippingAddressTable(component,event,'articleTwo');            
        }
                
        helper.getPhoneNumber(component,event,'articleTwo'); 
        
        if(component.get("v.selectedLookUpContactRecord").Id != undefined){        
            helper.getEmail(component,event,'articleTwo');             
        } 
        
        var acc = component.find('articleTwo');
            for(var cmp in acc) {
                $A.util.toggleClass(acc[cmp], 'slds-show');  
                $A.util.toggleClass(acc[cmp], 'slds-hide');  
            }
    },
   
   sectionThree : function(component, event, helper) {
       console.log("inside js controller");
       helper.getDeviceList(component,event,'articleThree');
       helper.getPriorityList(component,event,'articleThree');
       var acc = component.find('articleThree');
       for(var cmp in acc) {
           $A.util.toggleClass(acc[cmp], 'slds-show');  
           $A.util.toggleClass(acc[cmp], 'slds-hide');  
       }
   },
   
   sectionFour : function(component, event, helper) {
      helper.helperFun(component,event,'articleFour');
   }
    
   
})