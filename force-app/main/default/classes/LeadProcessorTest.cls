@isTest
public with sharing class LeadProcessorTest {
    @TestSetup
    static void makeData(){
        List<Lead> leadsList = new List<Lead>();
        for (Integer i=0;i<200;i++) {
            Lead lead = New lead();
            lead.FirstName ='FirstName '+i;
            lead.LastName ='LastName '+i;
            lead.Company ='Company '+i;
            leadsList.add(lead);
        }
        insert leadsList;
    }
    @isTest
    static void test(){   
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();   
    }
}