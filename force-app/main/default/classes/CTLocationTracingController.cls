public with sharing class CTLocationTracingController {
   public static list<Location_Tracing__c> getVisitors(String locationId){
      list<Location_Tracing__c> lct1=[SELECT Id, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, 
      LastReferencedDate, Person__c, Location__c, Visit_Date__c,Person__r.Token__c,Person__r.Health_Status__c FROM Location_Tracing__c WHERE Id=:locationId ORDER BY Visit_Date__c DESC];
      return lct1;
   }
  public static list<Location_Tracing__c> getLocationBYPersonIds(SET<Id> personIds){
   list<Location_Tracing__c> lct2=[SELECT Id, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, 
      LastReferencedDate, Person__c, Location__c, Visit_Date__c,Person__r.Token__c,Person__r.Health_Status__c FROM Location_Tracing__c WHERE Person__c IN: personIds AND Visit_Date__c = LAST_N_DAYS:10];
      return lct2;
  } 
  public static list<Location_Tracing__c> getLocationsByLocationIds(Set<Id> locationIds){
   list<Location_Tracing__c> lct3=[SELECT Id, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, 
      LastReferencedDate, Person__c, Location__c, Visit_Date__c,Person__r.Token__c,Person__r.Health_Status__c FROM Location_Tracing__c WHERE Location__c IN: locationIds AND Person__r.Health_Status__c='Green' AND Visit_Date__c = LAST_N_DAYS:10];
      return lct3;
  }
  public static list<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> locationTraces){
      
    Set<Id> locationIds=new Set<Id>();
       Set<Id> personIds=new Set<Id>();
 
       for(Location_Tracing__c trace:locationTraces){
          locationIds.add(trace.Location__c);
          personIds.add(trace.Person__c);
 
       }
 
       Map<Id,Set<Id>> mapofExistingrecords=new Map<Id,Set<Id>>();
     list<Location_Tracing__c> Existingrecords = [SELECT Id, Person__c, Location__c FROM Location_Tracing__c WHERE Location__c IN: locationIds AND Person__c IN:personIds];
 list<Location_Tracing__c> duplicates=new list<Location_Tracing__c>();
 
     if(Existingrecords!=null && Existingrecords.size()>0){//values
       for(Location_Tracing__c trace:Existingrecords){
        for(Location_Tracing__c innertrace:locationTraces){
            if(trace.Location__c==innertrace.Location__c&&trace.Person__c==innertrace.Person__c){
                duplicates.add(innertrace);
                break;
            }
        }
       }
     }
     return duplicates;
      }
    }