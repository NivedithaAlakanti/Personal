public with sharing class CTPersonController {
    public CTPersonController() {
    }
        public static string getToken(String MobileNo){
            Blob targetBlob = Blob.valueOf('MobileNo');
Blob hash = Crypto.generateDigest('MD5', targetBlob);
//get the string value of hashvaue
return EncodingUtil.base64Encode(hash);
        }

public static List<Person__c> getRecentHealthChanges() {
    List<Person__c> precords = [SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedById, LastModifiedDate, SystemModstamp, LastViewedDate, LastReferencedDate, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c ORDER BY Status_Update_Date__c  DESC NULLS Last LIMIT 100];
    return precords;
}

public static List<Person__c> searchPeople(String searchTerm) {
    List<Person__c> precords = [SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedById, LastModifiedDate, SystemModstamp, LastViewedDate, LastReferencedDate, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c 
                                WHERE Name like :searchTerm OR Mobile__c like :searchTerm OR Token__c like :searchTerm
                                ORDER BY Status_Update_Date__c DESC];

    return precords;
}

public static Person__c getPersonById(String personId) {
    Person__c precord = [SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedById, LastModifiedDate, SystemModstamp, LastViewedDate, LastReferencedDate, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c
                         WHERE Id = :personId LIMIT 1];


    return precord;
}
public static Map<String, Integer> gethealthStatusCount(){
    Map<String,Integer> Maprec=new Map<String,integer>();
    for(AggregateResult result:[SELECT Health_Status__c,COUNT(Id) countid FROM Person__c GROUP BY Health_Status__c]){
        String Val1=(string) result.get('Health_Status__c');
        //String Val1=string.valueOf(result.get('Health_Status__c'));

        Integer Val2=(Integer) result.get('countid');
        Maprec.put(Val1,val2);
    }
    return Maprec;
}


}