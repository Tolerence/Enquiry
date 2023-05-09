@IsTest
public class CreateLeadTriggerTest {

    @IsTest
    public static void testCreateLeadTrigger() {
        // Create test data
        Enquiry__c testEnquiry = new Enquiry__c(
            First_Name__c = 'John',
            Last_Name__c = 'Doe', 
            Enquiry_Type__c = 'Email', 
            Email__c = 'tkds@gmail.com', 
            Country__c = 'Australia (Code: AU)', 
            Holiday_Type__c = 'Value', 
            Number_of_Adults__c = 12
        );

        // Insert test data
        Test.startTest();
        insert testEnquiry;
        Test.stopTest();

        // Retrieve inserted leads
        List<Lead> leads = [SELECT FirstName, LastName FROM Lead];

        // Assert the number of leads created
        System.assertEquals(1, leads.size());

        // Assert lead field values
        Lead lead = leads[0];
        System.assertEquals('John', lead.FirstName);
        System.assertEquals('Doe', lead.LastName);
    }
}