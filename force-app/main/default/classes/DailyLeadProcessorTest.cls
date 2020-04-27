@isTest
public class DailyLeadProcessorTest {
    @TestSetup
    static void makeData(){
        List<Lead> leadsList = new List<Lead>();
        for (Integer i=0; i<200; i++) {
            Lead lead = New lead();
            lead.FirstName ='FirstName '+i;
            lead.LastName ='LastName '+i;
            lead.Company ='Company '+i;
            leadsList.add(lead);
        }
        insert leadsList;
    }
    @IsTest
    static void testScheduledJob(){
        String CRON_EXP = '0 0 0 15 3 ? 2022';
        Test.startTest();
            String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());    
        Test.stopTest();   
    }
}