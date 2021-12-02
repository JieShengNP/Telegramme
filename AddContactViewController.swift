//
//  AddContactViewController.swift
//  Telegramme
//
//  Created by MAD2 on 11/11/21.
//

import Foundation
import UIKit

class AddContactViewController : UIViewController{
    
    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var lastNameFld: UITextField!
    @IBOutlet weak var mobileFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
    }
    
    @IBAction func createBtn(_ sender: Any) {
        let contact:Contact = Contact(firstName:firstNameFld.text!, lastName: lastNameFld.text!, mobile: mobileFld.text!)
        
        appDelegate.contactList.append(contact)
    }
}
