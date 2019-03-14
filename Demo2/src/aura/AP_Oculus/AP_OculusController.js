({
    doInit: function(component, event, helper){
        component.set("v.rowId",component.get("v.recordId"));
        console.log("doinitOculus "+component.get("v.recordId")+" " +component.get("v.sObjectName"));
        component.set("v.objectName", component.get("v.sObjectName"));
    },
    afterScriptsLoaded : function(component, event, helper) {
         //jQuery('.wheretOShip').DataTable();
        
        jQuery("link.user").each(function(){
  	  jQuery(this).attr("disabled", "disabled");
  	});
        
     
		console.log('myjavaScript files loaded successful'); 
         
         (function($) {
            'use strict';
            
            jQuery(document).on('ready', function(){
                
                $('a.page-scroll').on('click', function(e){
                    var anchor = $(this);
                    $('html, body').stop().animate({
                        scrollTop: $(anchor.attr('href')).offset().top - 50
                    }, 1500);
                    e.preventDefault();
                });		
                
            }); 	
            
            
        })(jQuery);
        
       
        
         jQuery(function($){
             
             
           /*  jQuery('#wheretOShip').DataTable({
            "scrollY": "260px",
            "scrollCollapse": true,
            "paging": true,
            "pagingType": "simple",
            "searching": true,
            "ordering": true,
            "info": true});
        */
            var action,btn,input;
            jQuery(".number-spinner button").mousedown(function () {
               btn = jQuery(this);
                console.log('in',btn);
                input = btn.closest('.number-spinner').find('input');
                btn.closest('.number-spinner').find('button').prop("disabled", false);
                
                if (btn.attr('data-dir') == 'up') {
                    action = setInterval(function(){
                        if ( input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max')) ) {
                            input.val(parseInt(input.val())+1);
                        }else{
                            btn.prop("disabled", true);
                            clearInterval(action);
                        }
                    }, 50);
                } else {
                    action = setInterval(function(){
                        if ( input.attr('min') == undefined || parseInt(input.val()) > parseInt(input.attr('min')) ) {
                            input.val(parseInt(input.val())-1);
                        }else{
                            btn.prop("disabled", true);
                            clearInterval(action);
                        }
                    }, 50);
                }
            }).mouseup(function(){
                clearInterval(action);
            });
        });
	},
    
    setSelectedDeviceType: function (component, evt, helper) {
        //alert(cmp.find('select').get('v.value') + ' pie is good.');
        var selectedDeviceType = component.find('selectDevice').get('v.value');
        component.set("v.selectedDeviceType", selectedDeviceType);

    },
    
    setSelectedPriority: function (component, evt, helper) {
        //alert(cmp.find('select').get('v.value') + ' pie is good.');
        var selectedPriority = component.find('selectPriority').get('v.value');
        component.set("v.selectedPriority", selectedPriority);

    },
    
    setQuantity: function (component, evt, helper) {
        alert(component.find('selectQuantity').get('v.value'));
        //var selectedPriority = component.find('selectPriority').get('v.value');
        //component.set("v.selectedPriority", selectedPriority);

    },
    
    setShippingNote : function (component, evt, helper) {
        //alert("kapil");
       	//console.log(cmp.find("shippingNoteId").get("v.value"));
        var shippingNote = component.find('shippingNoteId').get('v.value');
        component.set("v.shippingNote", shippingNote);

    },
    
    
    sectionTwo : function(component, event, helper) {
        //console.log("accounid ",(component.get("v.selectedLookUpAccountRecord").Id != undefined)," contactid ",(component.get("v.selectedLookUpContactRecord").Id != undefined)," project ",(component.get("v.selectedLookUpProjectRecord").Id != undefined))
        if((component.get("v.selectedLookUpAccountRecord").Id != undefined) && (component.get("v.selectedLookUpContactRecord").Id != undefined) && (component.get("v.selectedLookUpProjectRecord").Id != undefined)){
            
            helper.createShippingAddressTable(component,event,helper);            
            helper.getPhoneNumber(component,event,helper); 
            console.log("In js controller");
            helper.getEmail(component,event,helper); 
            
        } 
        
        //alert("all fields mandatory");
        return true;
    },
    
    sectionThree : function(component, event, helper) {
        //console.log("accounid ",(component.get("v.selectedLookUpAccountRecord").Id != undefined)," contactid ",(component.get("v.selectedLookUpContactRecord").Id != undefined)," project ",(component.get("v.selectedLookUpProjectRecord").Id != undefined))
        if((component.get("v.selectedLookUpAccountRecord").Id != undefined) && (component.get("v.selectedLookUpContactRecord").Id != undefined) && (component.get("v.selectedLookUpProjectRecord").Id != undefined)){
            
            console.log("In section three js controller")
            helper.getDeviceList(component,event,helper);
       		helper.getPriorityList(component,event,helper);
            
            //return true;
        } 
        
        //alert("all fields mandatory");
        return true;
    },
    
    // this function automatic call by aura:waiting event  
    showSpinner: function(component, event, helper) {
        // make Spinner attribute true for display loading spinner 
        component.set("v.Spinner", true); 
    },
    
    // this function automatic call by aura:doneWaiting event 
    hideSpinner : function(component,event,helper){
        // make Spinner attribute to false for hide loading spinner    
        component.set("v.Spinner", false);
    },
    
    getSelectedContact: function(component, event, helper) {
        
        var account = event.getParam("singleRelatedRecord");
        console.log("Related account Oculus",account.Id);
        component.set("v.selectedLookUpAccountRecord" , account); 
    }
    
    
})