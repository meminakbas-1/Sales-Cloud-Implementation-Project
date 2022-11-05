trigger casetrigger on Case (after insert) {
    
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            CaseTriggerHandler.updateCaseWithParentId(Trigger.New);
        }
    }
}