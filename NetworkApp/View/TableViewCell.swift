//
//  TableViewCell.swift
//  NetworkApp
//
//  Created by Vikram Gupta on 11/8/18.
//  Copyright © 2018 Vikram Gupta. All rights reserved.
//

import UIKit

class ContactsCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateView(withContact contact: Contact) {
        self.name.text = contact.name
        self.email.text = contact.email
    }
}
