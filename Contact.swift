//
//  Contact.swift
//  Telegramme
//
//  Created by MAD2 on 11/11/21.
//

import Foundation
import CoreData

class Contact{
    var firstName: String?
    var lastName: String?
    var mobile: String?
    
    init(firstName:String, lastName:String, mobile:String){
        self.firstName = firstName;
        self.lastName = lastName;
        self.mobile = mobile;
    }
}
