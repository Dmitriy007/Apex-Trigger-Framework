public class TriggerManager {
	
	public class TriggerHandlerException extends Exception {}
	public enum triggerEventType {AfterDelete, AfterInsert, AfterUndelete, AfterUpdate, BeforeDelete, BeforeInsert, BeforeUpdate}
    
	private static Set<String> trProcessDone;
    static{
        trProcessDone = new Set<String>();
    }
    
    private static Boolean isProcess(String event, ITriggerHandler handler){
        if(!handler.StopRecursive()) return true;
        if(trProcessDone.contains(event))  return false;
        trProcessDone.add(event);
        return true;
    }
    
    public static void InitHandler(Type handler){ 
        Object handlerType 			 = handler.newInstance();
        ITriggerHandler handlerClass = (ITriggerHandler) handlerType;
        executeHandler(handlerClass);
    }
    
    public static void executeHandler(ITriggerHandler handler){
        
        if(handler.IsDisabled()) return;
        
        if(Trigger.IsBefore){

            if(Trigger.IsInsert) handler.BeforeInsert(Trigger.new);

            if(Trigger.IsUpdate) {
                if(isProcess(triggerEventType.BeforeUpdate.Name(), handler)) {
                	handler.BeforeUpdate(Trigger.newMap, trigger.oldMap);
                }
            }

            if(Trigger.IsDelete) handler.BeforeDelete(Trigger.oldMap);
        }
        
        if(Trigger.IsAfter){

            if(Trigger.IsInsert) {
                handler.AfterInsert(Trigger.newMap);   
            }

            if(Trigger.IsUpdate) {
                if(isProcess(triggerEventType.AfterUpdate.Name(), handler)) {
                    handler.AfterUpdate(Trigger.newMap, trigger.oldMap);
                }
            }

            if(trigger.IsDelete) handler.AfterDelete(Trigger.oldMap);

            if(trigger.isUndelete) handler.AfterUndelete(Trigger.oldMap);
        }
    }
    
}