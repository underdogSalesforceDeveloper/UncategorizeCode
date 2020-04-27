public class AccountProcessor {
    @future
    public static void countContacts(Set<Id> accIds){
        //MMR: Declare a list to hold all accounts (and related contacts) 
        //which Id is in the list passed to the method
        List<Account> accountsList = [SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts)
            FROM Account
            WHERE Id IN :accIds];
        for(Account acc : accountsList){
            List<Contact> contactsList = acc.Contacts;
            acc.Number_of_Contacts__c = contactsList.size();
        }
        Update accountsList;
    }
}