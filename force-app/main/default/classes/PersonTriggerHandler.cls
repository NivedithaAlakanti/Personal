public with sharing class PersonTriggerHandler {
    public PersonTriggerHandler() {

    }

    public static void beforeInsertHandler(list<Person__c> per){
        for (Person__c perrec : per) {
            perrec.Health_Status__c = 'Green';
        perrec.Token__c=CTPersonController.getToken(perrec.Mobile__c);
    }
}

public static void beforeUpdatehandler(list<Person__c> per,Map<Id,Person__c> oldMap){
    for (Person__c perrec : per) {
       // Person__c oldPerrec = Trigger.oldMap.get(perrec.Id);
        if (perrec.Health_Status__c != oldMap.get(perrec.Id).Health_Status__c) {
            perrec.Status_Update_Date__c = Date.today();
        }
    }
}

}