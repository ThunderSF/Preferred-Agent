/*
    Apex class having helper methods for CaseTrigger
*/
public without sharing class CaseTriggerHelper {
    
    public Static void assignMostRecentQueue(List<Case> list_cases, Map<Id,Case> map_OldCases){
        Map<Id,String> mapofIdToName = new Map<Id,String>();
        for(Group g : [SELECT Id, Name, DeveloperName FROM Group Where Type='Queue']){
            mapofIdToName.put(g.id,g.Name);
        }
        for(Case c : list_cases){
            if ((Trigger.Isinsert || Trigger.Isupdate && map_OldCases.get(c.id).OwnerId != c.OwnerId)
                && c.OwnerId.getSobjectType().getDescribe().getKeyPrefix() == '00G'
                && mapofIdToName.containsKey(c.OwnerId)){
                c.Most_Recent_Queue__c = mapofIdToName.get(c.OwnerId);
                c.Most_Recent_Queue_ID__c = c.OwnerId;    
             } 
       }
    }
}