public class CaseManagerCallout {
    public static HttpResponse makePostCallout() {
        String access_token = RequestAccessToken_JWTBearerFlow.getAccessToken();
        // String access_token = RequestAccessToken_UsernamePasswordFlow.makePostCallout();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://playful-fox-nlrq10-dev-ed.my.salesforce.com/services/apexrest/Cases');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'Bearer ' +access_token);
        request.setBody('{"subject" : "TEST15!","status" : "New","origin" : "Phone","priority" : "Low"}');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                         response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        return response;
    }    
}