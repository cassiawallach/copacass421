// Apex class
public class ContactManager {
    
    public static void createContact(String firstName, String lastName, String email) {
        Contact newContact = new Contact();
        newContact.FirstName = firstName;
        newContact.LastName = lastName;
        newContact.Email = email;
        insert newContact;
    }
    
    public static void updateContact(String contactId, String firstName, String lastName, String email) {
        Contact contactToUpdate = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Id = :contactId];
        contactToUpdate.FirstName = firstName;
        contactToUpdate.LastName = lastName;
        contactToUpdate.Email = email;
        update contactToUpdate;
    }
    
    public static void deleteContact(String contactId) {
        Contact contactToDelete = [SELECT Id FROM Contact WHERE Id = :contactId];
        delete contactToDelete;
    }
}