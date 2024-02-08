public with sharing class CTPeopleTracingController {
    public CTPeopleTracingController() {

    }

    public static list<People_Tracing__c> getTraces(String recordId){
        list<People_Tracing__c> pepletrace=[SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedById, LastModifiedDate, SystemModstamp, Contact_Date__c, LastViewedDate, LastReferencedDate, Contact_Type__c, Person_1__c, Person_2__c
                                   FROM People_Tracing__c WHERE Person_1__c =:recordId OR Person_1__c =:recordId  ORDER BY Contact_Date__c DESC];
                                   return pepletrace;


    }
    public static list<People_Tracing__c> checkDuplicates(list<People_Tracing__c> peopletraces){
        set<Id> personIds=new set<Id>();
        for(People_Tracing__c trace:peopletraces){
            personIds.add(trace.Person_1__c);
            personIds.add(trace.Person_2__c);
            
        }

        list<People_Tracing__c> existing=[SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedById, LastModifiedDate, SystemModstamp, Contact_Date__c, LastViewedDate, LastReferencedDate, Contact_Type__c, Person_1__c, Person_2__c
        FROM People_Tracing__c WHERE Person_1__c=:personIds OR Person_2__c=:personIds];
    list<People_Tracing__c> duplicates=new list<People_Tracing__c>();
    for(People_Tracing__c trace:existing){
        for(People_Tracing__c innertrace:peopletraces){
            if((trace.Person_1__c==innertrace.Person_1__c)||(trace.Person_1__c==innertrace.Person_2__c) && (trace.Person_2__c==innertrace.Person_2__c)||(trace.Person_2__c==innertrace.Person_2__c)){
                duplicates.add(trace);
                break;
            }
        }
    }
    return duplicates;
}
}