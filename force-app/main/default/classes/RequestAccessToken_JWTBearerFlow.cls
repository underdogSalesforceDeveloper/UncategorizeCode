// Prerequisites :
// Scenario : Integration between 2 SF Orgs
// 1 - Expose Apex class as a web service on Org 1
// 2 - >Remote Site Settings> Set up End point on Org 2
// 3 - >Certificate and Key Management> Create Self-Signed Certificate and download it 
// 4 - Set up a Connected App on Org 1 : 
// >App> Enable OAuth Settings, Use digital signatures (Import Certificate downloaded from Org 2), Selected OAuth Scopes (Perform requests on your behalf at any time)
// >App>Manage> OAuth Policies (Admin aproved users are pre-authorized)
// Authorize Connected App on user profiles
// 5 - Call endpoint from Org 2 with Access Token generated by this class

public class RequestAccessToken_JWTBearerFlow {
    public static String getAccessToken() {
        Auth.JWT jwt;
        Auth.JWS jws;
        
        String issuer = '############################################################################"';
        String cert = 'Cert01';
        String subject = 'mrabetmohamed22@playful-fox-nlrq10.com';
        String audience = 'https://login.salesforce.com';
        String token_endpoint = 'https://login.salesforce.com/services/oauth2/token';
        
        String jwt_string;
        String jws_string;
        String access_token;
        String bearer_flow;
        
        jwt = new Auth.JWT();
        
        jwt.setIss(issuer);
        jwt.setSub(subject);
        jwt.setAud(audience);
        
        jwt_string = jwt.toJSONString();    
        
        jws = new Auth.JWS(jwt, cert);
        
        jwt_string = jws.getCompactSerialization();   
        
        Auth.JWTBearerTokenExchange bearer = new Auth.JWTBearerTokenExchange(token_endpoint, jws); 
        
        access_token = bearer.getAccessToken();
        
        return access_token;
    } 
}