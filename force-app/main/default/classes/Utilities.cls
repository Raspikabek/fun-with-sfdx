public without sharing class Utilities {
    public static String getSObjectNameById(String some_id) {
        String id_prefix = String.valueOf(some_id).substring(0,3); //get just the prefix
        String sobject_type_name;
        Map<String, Schema.SObjectType> global_describe = Schema.getGlobalDescribe();
        for (Schema.SObjectType sobject_type : global_describe.values()) {
            Schema.DescribeSObjectResult describe_result = sobject_type.getDescribe();
            String prefix = describe_result.getKeyPrefix();
            if (prefix!=null && prefix.equals(id_prefix)) {
                sobject_type_name = describe_result.getName();
                break;
            }
        }
        return sobject_type_name;
    }

    public static Map<String, Id> getRecordTypesFromSObject(String sobject_type){
        Map<String, Id> m_recordTypes_developerName_id = new Map<String, Id>();
        for (RecordType rt : [SELECT Id, Developername FROM RecordType WHERE SObjectType = :sobject_type]) {
           m_recordTypes_developerName_id.put(rt.DeveloperName, rt.Id);
        }
        return m_recordTypes_developerName_id;
    }

    public static String getCuttedString(String my_string, Integer max_length){
        return (String.isBlank(my_string) || max_length == null || max_length >= my_string.length()) ? my_string : my_string.substring(0, max_length);
    }
}