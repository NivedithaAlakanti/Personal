public class AccountController {
    public static list<Account> insertAccounts(list<Account> accountToInsert){
        insert accountToInsert;
        return accountToInsert;
    }
    public static Account insertAccount(Account accountToInsert){
        insert accountToInsert;
        return accountToInsert;
    }
    public static list<Account> getAllAccounts(){
       List<Account> accounts=[SELECT Name,Phone FROM Account];
        return accounts;
        
    }
     public static void printAllAccounts(){
       List<Account> accounts=getAllAccounts();
        for(Account account:accounts){
            System.debug('Account Name: '+account.Name+'Account Phone'+account.Phone);
            
        }
        
    } 
     public static Integer getAccountsize(){
       List<Account> accounts=getAllAccounts();
        return accounts.size();
        
    }
    
    
}