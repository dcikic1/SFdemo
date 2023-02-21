/* Trigger should populate isVip on Account record, if Primary Contact isVip == true
*  Provide any suggestions on improvement
*/
trigger account_trigger on Account (
    before insert, 
    before update,
    before delete, 
    after insert,  
    after update, 
    after delete, 
    after undelete)   {
    if (Trigger.isUpdate) {
          for (Account a: trigger.new) {
            if (getprimcontact(a.Id).isVip__c) {
               a.isVip__c = true;
            }
    }
    }

    public List<Contact> getprimcontact (Id accountid) {
        return [SELECT id, isVip__c FROM Contact
            WHERE accountid =: accountid AND primary__c = true];
    }
}