trigger CaseTrigger on Case (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    TriggerManager.InitHandler(CaseTriggerHandler.class);
}