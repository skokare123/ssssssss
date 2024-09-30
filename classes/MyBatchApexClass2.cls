global class MyBatchApexClass2 implements Database.Batchable<Sobject> {
    global Database.QueryLocator Start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Name,Fees__c,Discount__c,Website__c From Course__c where Fees__c=55000');
    }
    global void execute(Database.BatchableContext bc,List<Course__c>Scope){
        for(Course__c cos:Scope){
            cos.Website__c='www.gov.com';
            cos.Discount__c=25;
        }
        Update Scope;
    }
    global void Finish(Database.BatchableContext bc){
        system.debug('operation finished');
    }

}
