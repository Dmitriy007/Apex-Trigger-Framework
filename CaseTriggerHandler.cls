public with sharing class CaseTriggerHandler implements ITriggerHandler{
	
	public static Boolean runTriggerOnce 	= true;
    public static Boolean triggerDisabled 	= false;
    public Boolean StopRecursive(){return runTriggerOnce;}
    public Boolean IsDisabled(){return triggerDisabled;}
    
    /* ========== TRIGGER METHODS ========== */ 

    public void BeforeInsert(List<SObject> newItems){
    	// filter out records to process in private methods/handlers
    	assignContactsForCases(casesWithEmails);
    }
    
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
    
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
    
    public void AfterInsert(Map<Id, SObject> newItems) {}
    
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
    
    public void AfterDelete(Map<Id, SObject> oldItems) {}
    
    public void AfterUndelete(Map<Id, SObject> oldItems) {}


    /* ========== OTHER METHODS ========== */

    private void assignContactsForCases(Map<String, Case> emailsWithCases){
    	// logic
    }

}