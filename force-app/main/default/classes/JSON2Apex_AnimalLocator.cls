public class JSON2Apex_AnimalLocator {
    public Animal animal;
    
    public class Animal {
        public Integer id;
        public String name;
        public String eats;
        public String says;
    }
    
    public static JSON2Apex_AnimalLocator parse(String json) {
        return (JSON2Apex_AnimalLocator) System.JSON.deserialize(json, JSON2Apex_AnimalLocator.class);
    }
}