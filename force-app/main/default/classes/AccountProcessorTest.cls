@isTest
public class AccountProcessorTest {
    @isTest
    public static void testCountContactsMethod(){
        Account acc1 = new Account();
        acc1.Name = 'Test Account';
        Insert acc1;

        Contact cnt1 = New Contact();
        cnt1.FirstName ='Moha';
        cnt1.LastName ='Le Fou';
        cnt1.AccountId = acc1.Id;
        Insert cnt1;

        Contact cnt2 = New Contact();
        cnt2.FirstName ='Moha';
        cnt2.LastName ='Le Sage';
        cnt2.AccountId = acc1.Id;
        Insert cnt2;

        Set<Id> accIds = new Set<Id>();
        accIds.add(acc1.Id);
        Test.startTest();
            AccountProcessor.countContacts(accIds);
        Test.stopTest();
    }
}