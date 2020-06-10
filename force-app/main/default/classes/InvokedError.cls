global class InvokedError {

    global static FlowExceptionSettings__c flowSettings = FlowExceptionSettings__c.getInstance();
    
    @InvocableMethod(label='Invoke an Error')
    global static List<InvokeErrorActionResult> invokeError(List<InvokeErrorActionRequest> requests) {
        List<InvokeErrorActionResult> results = new List<InvokeErrorActionResult>();
        for (InvokeErrorActionRequest request : requests) {
            results.add(new InvokeErrorActionResult('My Apex Error'));
        }

        if(flowSettings.ThrowException__c) {
            throw new InvocableException('Apex Error');
        }
            
        return results;
    }


    global class InvokeErrorActionRequest {
        @InvocableVariable(required=true)
        global String errorIn;
    }

    global class InvokeErrorActionResult {
        @InvocableVariable
        global String errorOut;
        InvokeErrorActionResult(String errorOut) {
            this.errorOut = errorOut;
        }
    }

    public class InvocableException extends Exception {}
}
