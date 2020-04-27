public class RequestAccessToken_UsernamePasswordFlow {
    
    public static String makePostCallout() {
        
        string url = 'https://login.salesforce.com/services/oauth2/token';
        string clientId = '&client_id=3MVG95G8WxiwV5Ps9BHOzHpE7ulmyTe374unBbXmbw3xEIkdF6PaOVyhheL9sWBCtinl9BubnDhoKeM86f2NN';
        String clientSecret ='&client_secret=##############################################';
        String grantType ='?grant_type=password';
        String userName ='&username=mrabetmohamed22@playful-fox-nlrq10.com';
        String password ='&password=passwordfollowedbyaccesstoken';
        
        String fullUrl = url+grantType+clientSecret+clientId+userName+password;
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(fullUrl);
        request.setMethod('POST');
        request.setHeader('Content-Type','application/x-www-form-urlencoded'); 

        HttpResponse response = http.send(request);
        JSON2Apex_RequestAccessToken result = (JSON2Apex_RequestAccessToken) 
            JSON.deserialize(response.getBody(),JSON2Apex_RequestAccessToken.class);
        
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
            	response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        
        return result.access_token;
        
    }
    
}