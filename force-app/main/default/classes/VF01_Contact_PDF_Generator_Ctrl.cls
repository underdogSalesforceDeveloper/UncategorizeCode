public with sharing class VF01_Contact_PDF_Generator_Ctrl {
    
    public VF01_Contact_PDF_Generator_Ctrl(ApexPages.StandardController controller){}
    
    public PageReference savePdf() {
        
        // GET PARENT RECORD ID
        String parentRecordId = Apexpages.currentPage().getParameters().get('Id');
        
        // EXECUTE VF PDF PAGE (RENDERAS="PDF")
        PageReference pdf = Page.VF01_Contact_PDF;
        
        // SET PARENT OBJECT RECORD
        pdf.getParameters().put('id',parentRecordId);
        
        // CREATE AN ATTACHMENT OBJECT RECORD
        Attachment attach = new Attachment();  
        
        // GET THE VISUALFORCE PAGE IN A BLOB
        Blob body;
        try {
            body = pdf.getContent();
        } catch (VisualforceException e) {
            body = Blob.valueOf('Error : ' + e);
        }
        
        // ATTACH FILE TO ATTACHMENT OBJECT AND RENAME FILE
        attach.Body = body;
        attach.Name = Datetime.now().format('yyyy-MM-dd HH:mm') + '.pdf';
        attach.IsPrivate = false;
        
        // ADD TO PARENT OBJECT RECORD
        attach.ParentId = parentRecordId;
        insert attach;
        
        // GET PARENT RECORD EMAIL
        Contact cnt = null;
        List<Contact> cnts = [SELECT Id, email FROM Contact WHERE Id = :parentRecordId];

        // CHECK FOR EMPTYNESS
        if(!cnts.isEmpty()){
            cnt = cnts[0];
            String email = cnt.email;

            //CREATE EMAIL 
            Messaging.EmailFileAttachment mailAtt = new Messaging.EmailFileAttachment();
            mailAtt.setBody(body);
            mailAtt.setContentType('application/pdf');
            mailAtt.setFileName('attachment.pdf');
            Messaging.SingleEmailMessage mess = new Messaging.SingleEmailMessage();
            mess.setSubject('Email');
            mess.setToAddresses(new String[]{email});
            mess.setPlainTextBody('Here is your attachment.');
            mess.setFileAttachments(new Messaging.EmailFileAttachment[]{mailAtt});
            
            // SEND EMAIL
            Messaging.sendEmail(new Messaging.Email[]{mess},false);

        }
        
        // TAKE USER TO PARENT RECORD
        return new PageReference('/' + parentRecordId);
        
    } 
}