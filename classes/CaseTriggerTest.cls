/*
    Apex class having test method for Trigger 'CaseTrigger' on Case Object
*/
@istest
private class CaseTriggerTest {

    // method to test contact populate from Supplied Email
    private static testMethod void testTrigger01(){
        
        Contact con = new Contact( Email = 'Test123@Test.com' , LastName= 'Test');
        insert con;
        
        Test.startTest();
            Case  case2 =  new Case( Origin= 'Email', SuppliedEmail = 'Test123@Test.com' );
            insert case2;
        Test.stopTest();        
        Case afterTrigger = [ SELECT Id, ContactId, SuppliedEmail 
                              FROM Case 
                              WHERE SuppliedEmail =: con.Email 
                            ];
        System.assertEquals( afterTrigger.ContactId, con.Id );        
    }    
}