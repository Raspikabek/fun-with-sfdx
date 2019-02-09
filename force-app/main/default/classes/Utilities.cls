public with sharing class Utilities {
    
    public static Map<String,Id> getRecordTypesFromSObject(String so){
        Map<String, Id> mRecordTypes = new Map<String, Id>();
        for (RecordType rt : [SELECT Id, Developername FROM RecordType WHERE SObjectType = :so]) {
           mRecordTypes.put(rt.DeveloperName, rt.Id);
        }
        return mRecordTypes;
    }
}