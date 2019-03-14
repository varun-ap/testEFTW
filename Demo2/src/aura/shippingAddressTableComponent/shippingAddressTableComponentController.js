({
    
    doInit: function(component,event,helper) {
        
        if((component.get("v.accountRecord").Id != undefined) && (component.get("v.contactRecord").Id != undefined) && (component.get("v.projectRecord").Id != undefined)){
            
            alert ("hi"+ component.get("v.accountRecord").Id);
            //cmp.set("v.setMeOnInit", "controller init magic!");
        }
    }
})