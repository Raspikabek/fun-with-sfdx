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
    private static void testCutText(){
        String myText = '1234567890';
        String returned = Utilities.cutText(myText, 5);
        System.assertEquals('12345', returned);
    }
}