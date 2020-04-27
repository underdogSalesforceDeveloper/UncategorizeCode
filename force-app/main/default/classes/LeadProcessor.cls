global class LeadProcessor implements Database.Batchable<sObject>{

    List<Lead> leadsList = new List<Lead>();

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, LeadSource FROM Lead'
        );
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        for (Lead lead : scope) {
            lead.LeadSource = 'Dreamforce';
            leadsList.add(lead);
        }
        update leadsList;
    }

    global void finish(Database.BatchableContext bc){}
}