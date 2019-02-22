@isTest
private with sharing class UtilitiesTest {
    @TestSetup
    static void makeData(){
        Account test_account = new Account(
            Name = 'Test Account'
        );
        insert test_account;
    }

    @isTest 
    private static void testGetSObjectNameById() {
        Account test_account = [SELECT Id FROM Account WHERE Name != NULL LIMIT 1];
        String sobject_name = Utilities.getSObjectNameById(test_account.Id);
        System.assertEquals('Account', sobject_name, 'Expecting Account SObject Type');
    }

    @isTest
    public static void testGetRecordTypes(){
        Test.startTest();
        Map<Id, RecordType> soy_un_mapa_de_recordtypes_por_id = new Map<Id, RecordType>([SELECT Id FROM RecordType WHERE SObjectType = 'Account']);
        System.assertEquals(soy_un_mapa_de_recordtypes_por_id.size(), Utilities.getRecordTypesFromSObject('Account').size());
        Test.stopTest();
    }

    @isTest
    private static void testGetCuttedString(){
        String my_string = '1234567890';
        String returned = Utilities.getCuttedString(my_string, 5);
        System.assertEquals('12345', returned);
    }
}