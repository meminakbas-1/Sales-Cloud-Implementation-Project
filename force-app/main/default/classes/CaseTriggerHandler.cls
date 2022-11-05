public class CaseTriggerHandler {
    public static void updateCaseWithParentId(list<Case> newCases){
        set<Id> setAccount = new set<Id>();
        Map<Id, list<Case>> accountToCase = new Map<Id, list<Case>>();
        list<Case> lstCases = new list<Case>();
        
        for(Case c : newCases){
            setAccount.add(c.AccountId);
        }
        
        list<Account> lstAccount = [SELECT Id, (SELECT Origin, ParentId, AccountId FROM Cases ORDER BY CreatedDate ASC) 
                                    FROM Account WHERE Id IN :setAccount];
        for(Account a : lstAccount){
            accountToCase.put(a.Id, a.Cases);
        }
        
        for(Case c : newCases){
            for(Case oldCase : accountToCase.get(c.AccountId)){
                if((c.Origin == oldCase.Origin) && (c.Id != oldCase.Id)){
                    lstCases.add(new Case(Id = c.Id, ParentId = oldCase.Id));
                    break;
                }
            }
        }
        update lstCases;
    }
}