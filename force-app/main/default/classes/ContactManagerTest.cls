// Test class
@isTest
private class ContactManagerTest {
    
    @isTest static void testCreateContact() {
        ContactManager.createContact('John', 'Doe', 'johndoe@example.com');
        List<Contact> contacts = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE FirstName = 'John' AND LastName = 'Doe'];
        System.assertEquals(1, contacts.size());
        System.assertEquals('johndoe@example.com', contacts[0].Email);
    }
    
    @isTest static void testUpdateContact() {
        ContactManager.createContact('John', 'Doe', 'johndoe@example.com');
        List<Contact> contacts = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE FirstName = 'John' AND LastName = 'Doe'];
        Contact contactToUpdate = contacts[0];
        ContactManager.updateContact(contactToUpdate.Id, 'Jane', 'Doe', 'janedoe@example.com');
        contacts = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Id = :contactToUpdate.Id];
        System.assertEquals('Jane', contacts[0].FirstName);
        System.assertEquals('Doe', contacts[0].LastName);
        System.assertEquals('janedoe@example.com', contacts[0].Email);
    }
    
    @isTest static void testDeleteContact() {
        ContactManager.createContact('John', 'Doe', 'johndoe@example.com');
        List<Contact> contacts = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE FirstName = 'John' AND LastName = 'Doe'];
        Contact contactToDelete = contacts[0];
        ContactManager.deleteContact(contactToDelete.Id);
        contacts = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Id = :contactToDelete.Id];
        System.assertEquals(0, contacts.size());
    }
}