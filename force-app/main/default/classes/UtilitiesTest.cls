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
    
    /*@isTest
    public static void testGetRecordTypes(){
        Test.startTest();
        Utilities.getRecordTypesFromSObject('Account');
        Test.stopTest();
    }*/
}