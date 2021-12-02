//
//  FriendController.swift
//  Telegramme
//
//  Created by MAD2 on 25/11/21.
//

import UIKit
import CoreData

class FriendController{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func addMessageToFriend(friend: Friend, message: Message) {
        var managedfriendList:[NSManagedObject] = []
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFriend")
        fetchRequest.predicate = NSPredicate(format: "name = %@", friend.name!)
        
        let entity = NSEntityDescription.entity(forEntityName: "CDMessage", in: context)!
        let cdMessage = NSManagedObject(entity: entity, insertInto: context) as! CDMessage
        
        cdMessage.text = message.message
        
        do {
            managedfriendList = try context.fetch(fetchRequest)
        }
    }
}
