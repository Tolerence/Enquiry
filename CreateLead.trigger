trigger CreateLead on Enquiry__c (after insert) {

    List<Lead> newLeads = new List<Lead>();
    for (Enquiry__c Enquiry : Trigger.new) {
        String firstName = Enquiry.First_Name__c;
        String lastName = Enquiry.Last_Name__c;
        
    // Check if both first name and last name are provided
    if (String.isNotBlank(firstName) && String.isNotBlank(lastName)) {
          Lead lead = new Lead();
          lead.FirstName = firstName;
          lead.LastName = lastName;
        lead.Company = 'Enquiry';
        //Add new lead
        newLeads.add(lead);
        
            
        }
    }

    if (!newLeads.isEmpty()) {
        insert newLeads;
    }
}