//
//  DetailViewController.swift
//  Telegramme
//
//  Created by MAD2 on 11/11/21.
//

import Foundation
import UIKit

class DetailViewController : UIViewController{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var mobileLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobileLbl.text = appDelegate.contactList[appDelegate.selectedRow].mobile
    }
    
}
