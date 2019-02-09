@isTest
private with sharing class UtilitiesTest {
    
    @isTest
    public static void testGetRecordTypes(){
        Test.startTest();
        Utilities.getRecordTypesFromSObject('Account');
        Test.stopTest();
    }
}