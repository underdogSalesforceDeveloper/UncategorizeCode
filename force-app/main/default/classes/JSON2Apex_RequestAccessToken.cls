//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public class JSON2Apex_RequestAccessToken {

	public String access_token;
	public String instance_url;
	public String id;
	public String token_type;
	public String issued_at;
	public String signature;

	
	public static JSON2Apex_RequestAccessToken parse(String json) {
		return (JSON2Apex_RequestAccessToken) System.JSON.deserialize(json, JSON2Apex_RequestAccessToken.class);
	}
}