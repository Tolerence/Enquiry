public class EnquiryApi {
    public static String generateRequestBodyString(Enquiry__c enquiry) {
        Map<String, Object> requestBodyMap = new Map<String, Object>();
        requestBodyMap.put('website_reference_number', enquiry.Enquiry_Number__c);
        requestBodyMap.put('first_name', enquiry.First_Name__c);
        requestBodyMap.put('last_name', enquiry.Last_Name__c);
        requestBodyMap.put('email', enquiry.Email__c);
        requestBodyMap.put('contact_number', enquiry.Phone__c);
        requestBodyMap.put('country', enquiry.Country__c);
        requestBodyMap.put('arrival_date', enquiry.Arrival_Date__c);
        requestBodyMap.put('depature_date', enquiry.Departure_Date__c);
        requestBodyMap.put('adults', enquiry.Number_of_Adults__c);
        requestBodyMap.put('children', enquiry.Number_of_Children__c);
        requestBodyMap.put('comments', enquiry.Comments__c);
        requestBodyMap.put('ed_website', '72');
        requestBodyMap.put('ed_passkey', 'devpass');

        return JSON.serialize(requestBodyMap);
    }

    @future(callout = true)
    public static void doPost(String body) {
        try {
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://eddy.rhinoafrica.com/submit');
            req.setHeader('Content-Type', 'application/json');
            req.setMethod('POST');
            req.setBody(body);

            HttpResponse res = http.send(req);
            String responseBody = res.getBody();
            Map<String, Object> sResponse = (Map<String, Object>) JSON.deserializeUntyped(responseBody);
        } catch (Exception e) {
            throw new SearchException(e.getMessage());
        }
    }
}