trigger Account on Account (before insert, before update) {

    List<Account> newAccounts = Trigger.new;

    BrazilianDocumentValidator validator = new BrazilianDocumentValidator();

    switch on Trigger.operationType {

        when BEFORE_INSERT, BEFORE_UPDATE {

            for ( Account account : newAccounts) {     
                
                if ( !validator.isValid(account.DocumentNumber__c) ) {
                    account.DocumentNumber__c.addError('Documento Iválido');
                }
            }
        }
    }
}