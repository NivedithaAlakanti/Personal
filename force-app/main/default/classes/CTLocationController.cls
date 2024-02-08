public with sharing class CTLocationController {
    public CTLocationController() {

    }
    public static List<Location__c> getRecentChanges(){
        list<Location__c> lcd=[SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, 
        CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate,
         Address__c, LastReferencedDate, Pincode__c, Red_Score__c, Status_Update_Date__c, 
         Status__c FROM Location__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];
          return lcd;
       }
       public static list<Location__c> searchLocations(String searchTerm){
        list<Location__c> lcd2=[SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, 
        CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate,
         Address__c, LastReferencedDate, Pincode__c, Red_Score__c, Status_Update_Date__c, 
         Status__c FROM Location__c WHERE Name like:searchTerm+'%' OR Pincode__c like:searchTerm+'%' OR Address__c like:searchTerm+'%' ORDER BY Status_Update_Date__c DESC];
          return lcd2;
       }
       public static Location__c getLocationById(String locationId){
        list<Location__c> lcd3=[SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, 
        CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate,
         Address__c, LastReferencedDate, Pincode__c, Red_Score__c, Status_Update_Date__c, 
         Status__c FROM Location__c WHERE Id= :locationId];
         if(lcd3 !=null && lcd3.size()>0){
            return lcd3[0];
         }
         return null;
       }

       public static Map<String,Integer> getStatusCount(){
         Map<String,Integer> Maprec=new Map<String,Integer>();
         for(AggregateResult result:[SELECT Status__c,COUNT(Id) countid FROM Location__c GROUP BY Status__c]){
         String val1=String.valueOf(result.get('Status__c'));
         Integer val2=Integer.valueOf(result.get('countid'));
         Maprec.put(val1,val2);
       }
       return Maprec;
      }
}