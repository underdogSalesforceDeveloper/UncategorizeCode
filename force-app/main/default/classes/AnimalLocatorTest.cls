@isTest
public class AnimalLocatorTest {
    @isTest static void testGetCallout() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String returnedValue = AnimalLocator.getAnimalNameById(1);
        System.debug('returnedValue=' + returnedValue);
        System.assertEquals('chicken', returnedValue);   
    }
}