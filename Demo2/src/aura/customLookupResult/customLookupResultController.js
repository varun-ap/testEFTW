({
    selectRecord : function(component, event, helper){ 
        
        
        if(component.get("v.objectAPIName")=="contact"){
            console.log("contact selected");
            helper.getSingleAccount(component, event, helper);
        }else{
            console.log("in else");
            // get the selected record from list  
            var getSelectRecord = component.get("v.oRecord");
            // call the event   
            var compEvent = component.getEvent("oSelectedRecordEvent");
            // set the Selected sObject Record to the event attribute.  
            compEvent.setParams({"recordByEvent" : getSelectRecord });  
            // fire the event  
            compEvent.fire();
        }
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
	}
    
})