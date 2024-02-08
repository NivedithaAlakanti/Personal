trigger ContactaccountTrigger on Contact (before insert,After insert) {
    
    set<id> accids=new set<id>();
    Switch on trigger.OperationType{
        when AFTER_INSERT{
        for(Contact ContactRecords:trigger.new){
        if(ContactRecords.Active__c==true){
            accids.add(ContactRecords.AccountId);
        }
    }
            list<Account> accs=[Select id,Name,Activecheckboxes__c from Account where id in:accids];
            for(Account acc: accs){
                acc.Activecheckboxes__c=1;
            }
    }
    }

}