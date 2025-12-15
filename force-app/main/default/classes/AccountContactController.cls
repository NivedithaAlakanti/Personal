public with sharing class AccountContactController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByIndustry(String industry) {
        return [SELECT Id, Name, Industry, AnnualRevenue FROM Account WHERE Industry = :industry];
    }
}