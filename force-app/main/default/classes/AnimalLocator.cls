public class AnimalLocator {
    public static String getAnimalNameById(Integer animalId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+animalId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        JSON2Apex_AnimalLocator result = (JSON2Apex_AnimalLocator) JSON.deserialize(response.getBody(),JSON2Apex_AnimalLocator.class);
		return result.animal.name;
    }
}