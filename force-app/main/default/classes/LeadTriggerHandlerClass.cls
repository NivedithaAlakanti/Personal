public class LeadTriggerHandlerClass {
    public static boolean isExecuted=false;
    public static void beforeinsertHandler(list<Lead> leadRecords){
        for(Lead LeadRecord:leadRecords){
            if(String.isBlank(LeadRecord.LeadSource)){
                LeadRecord.LeadSource='Other';
            }
            
            if(String.isBlank(LeadRecord.Industry)&& (trigger.isInsert)){
                LeadRecord.addError('Industry cannot be empty');
            }
        }
        
    }
    public static void beforeupdateHandler(list<Lead> leadRecords,Map<Id,Lead> oldMap){
        for(Lead LeadRecord:leadRecords){
            if(LeadRecord.Status=='Closed - Converted'|| LeadRecord.Status=='Closed - Not Converted' && oldMap.get(LeadRecord.id).Status=='Open - Not Contacted'){
                LeadRecord.Status.addError('You canot close the status');
            }
            
        }
    }
    public static void afterinsertHandler(list<Lead> leadRecords){
        list<Task> tss=new list<task>();
        for(Lead LeadRecord:leadRecords){
            Task leadTask=new Task();
            leadTask.Subject='Lead followup task';
            leadTask.WhoId=LeadRecord.Id;
            tss.add(leadTask);
        }
        insert tss;
        if(LeadTriggerHandlerClass.isExecuted==false){
            isExecuted=true;
            
            lead ld=new lead();
            ld.LastName='test';
            ld.Industry='Agriculture';
            ld.Company='etg';
            insert ld;  
            
        }
        
        
    }
    
}