@isTest
public class AddPrimaryContactTest {
    @TestSetup
    static void makeData(){

        List<Account> accountsList = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            if (i<50) {
                accountsList.add(new Account(Name='Test Account '+i, BillingState='NY'));
            } else {
                accountsList.add(new Account(Name='Test Account '+i, BillingState='CA'));
            }    
        }
        insert accountsList;

    }

    @isTest
    static void testQueueable(){ 

        Contact cntParam = new Contact();
        cntParam.FirstName='FirstName';
        cntParam.LastName ='LastName';
        insert cntParam;

        String sttParam = 'CA';

        AddPrimaryContact apc = new AddPrimaryContact(cntParam, sttParam);
        
        Test.startTest();
            System.enqueueJob(apc);
        Test.stopTest();  
    }

}