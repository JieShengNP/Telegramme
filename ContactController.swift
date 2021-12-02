//
//  ContactController.swift
//  Telegramme
//
//  Created by MAD2 on 25/11/21.
//

import UIKit
import CoreData

class ContactController{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    init(){
        
    }
    
    func AddContact(newContact: Contact){
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Contact", in: context)!
        
        let contact = NSManagedObject(entity:entity, insertInto: context)
        contact.setValue("Name", forKey: "firstName")
        contact.setValue("LastName", forKey: "lastName")
        contact.setValue("91234567", forKey: "mobile")
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func retrieveAllContact()->[Contact]
    {
        var managedcontactList:[NSManagedObject] = []
        var contactList:[Contact] = []
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        do {
            managedcontactList = try context.fetch(fetchRequest)
            for c in managedcontactList {
                let firstName = c.value(forKeyPath: "firstName") as! String
                let lastName = c.value(forKeyPath: "lastName") as! String
                let mobile = c.value(forKeyPath: "mobile") as! String
                let contact:Contact = Contact(firstName: firstName, lastName: lastName, mobile: mobile)
                contactList.append(contact)
            }
        } catch let error as NSError{
            print("Could not fetch. \(error) \(error.userInfo)")
        }
        return contactList
    }
    
    func updateContact(mobile:String, newContact:Contact){
        
    }
    
    func searchContact(mobileSearch:String)->Bool{
        var managedcontactList: [NSManagedObject] = []
        var result:Bool = false
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        do{
            managedcontactList = try context.fetch(fetchRequest)
            for c in managedcontactList {
                let mobile = c.value(forKeyPath: "mobile") as! String
                if (mobile == mobileSearch){
                    result = true
                    break
                }
            }
        } catch let error as NSError{
            print("Could not fetch. \(error) \(error.userInfo)")
        }
        return result
    }
}
