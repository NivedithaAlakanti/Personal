trigger Persontrigger on Person__c (before insert, before update) {
    switch on trigger.OperationType{
        when BEFORE_INSERT {
            PersonTriggerHandler.beforeInsertHandler(Trigger.new);
        } 
        when BEFORE_UPDATE {
           PersonTriggerHandler.beforeUpdatehandler(Trigger.new,Trigger.oldMap);
        }
    }
}
