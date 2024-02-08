trigger SecondTrigger on Lead (before insert,before update) {
    for(Lead LeadRecord:Trigger.new){
        if(String.isBlank(LeadRecord.Rating)){
            LeadRecord.Rating='Warm';
        }
    }
    system.debug('trigger2');

}