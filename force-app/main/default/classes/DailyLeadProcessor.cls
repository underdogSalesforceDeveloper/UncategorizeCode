public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx) {
        List<Lead> leadsList = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = NULL LIMIT 200];
        for (Lead leadLooper : leadsList) {
            leadLooper.LeadSource = 'Dreamforce';
        }
        update leadsList;
    }
}