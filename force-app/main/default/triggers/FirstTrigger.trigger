trigger FirstTrigger on Lead (before insert,before update,after update,after insert) {
    switch on Trigger.OperationType{
    when BEFORE_INSERT{
        LeadTriggerHandlerClass.beforeinsertHandler(trigger.new);
    }   
    when BEFORE_UPDATE{
        LeadTriggerHandlerClass.beforeupdateHandler(trigger.new, trigger.oldMap) ;
    }
        when AFTER_INSERT{
           
   LeadTriggerHandlerClass.afterinsertHandler(trigger.new);
    } 
        
    
    }
}