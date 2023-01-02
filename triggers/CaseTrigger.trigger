/*
    Apex Trigger on Case Object
*/
trigger CaseTrigger on Case (before insert, before update, before delete,
                             after insert, after update, after delete, after undelete
                            ) {
    
    
    if( Trigger.isBefore ) {
        if( Trigger.isInsert ){
            CaseTriggerHelper.assignMostRecentQueue((List<Case>)trigger.new,(Map<Id,Case>)trigger.oldMap);
        }
        if( Trigger.isUpdate){
            CaseTriggerHelper.assignMostRecentQueue((List<Case>)trigger.new,(Map<Id,Case>)trigger.oldMap);
        }
    }
}