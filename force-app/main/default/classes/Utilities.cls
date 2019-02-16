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

    public static String cutText(String text, Integer numChar){
        String converted = '';
        if(!String.isBlank(text)){
            converted = (numChar == null || numChar >= text.size()) ? text : text.substring(0, numChar);
        }
        return converted;
    }
}
