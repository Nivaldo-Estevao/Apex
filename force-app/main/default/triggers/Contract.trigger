trigger Contract on Contract (after update) {

    List<Contract> newContracts = Trigger.new;

    List<Contract> oldContracts = Trigger.old;

    switch on Trigger.operationType {
        
        when AFTER_UPDATE {
            
        } 
        
    }

}