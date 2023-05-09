import { LightningElement, api } from 'lwc';
import ENQUIRY_OBJECT from '@salesforce/schema/Enquiry__c'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ENQUIRY_TYPE from '@salesforce/schema/Enquiry__c.Enquiry_Type__c';
import FIRST_NAME from '@salesforce/schema/Enquiry__c.First_Name__c';
import LAST_NAME from '@salesforce/schema/Enquiry__c.Last_Name__c';
import EMAIL from '@salesforce/schema/Enquiry__c.Email__c';
import COUNTRY from '@salesforce/schema/Enquiry__c.Country__c';
import PHONE from '@salesforce/schema/Enquiry__c.Phone__c';
import HOLIDAY from '@salesforce/schema/Enquiry__c.Holiday_Type__c';
import ADULTS from '@salesforce/schema/Enquiry__c.Number_of_Adults__c';
import CHILDREN from '@salesforce/schema/Enquiry__c.Number_of_Children__c';
import ARRIVAL from '@salesforce/schema/Enquiry__c.Arrival_Date__c';
import DEPARTURE from '@salesforce/schema/Enquiry__c.Departure_Date__c';
import COMMENTS from '@salesforce/schema/Enquiry__c.Comments__c';
export default class Enquiry_form extends LightningElement {
    // objectApiName is "Enquiry" when this component is placed on an enquiry record page
    objectApiName = ENQUIRY_OBJECT;
    
    fields = [ENQUIRY_TYPE,FIRST_NAME, LAST_NAME,EMAIL, COUNTRY, PHONE, 
            HOLIDAY, ADULTS, CHILDREN, ARRIVAL,
                DEPARTURE, COMMENTS];
    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: "Enquiry created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(evt);
    }
}