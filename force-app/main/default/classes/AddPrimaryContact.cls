public class AddPrimaryContact implements Queueable {

    private Contact cnt;
    private String stt;

    public AddPrimaryContact(Contact cntParam, String sttParam) {
        this.cnt = cntParam;
        this.stt = sttParam;
    }

    public void execute(QueueableContext context) {
        List<Account> accountsList = [SELECT Id FROM account WHERE BillingState = :stt LIMIT 200];
        List<Contact> contactsList = new List<Contact>();
        for (Account account : accountsList) {
            Contact primaryCnt = cnt.clone();
            primaryCnt.AccountId = account.Id;
            contactsList.add(primaryCnt);
        }
        if (contactsList.size()>0) {
            insert contactsList;
        }
    }

}