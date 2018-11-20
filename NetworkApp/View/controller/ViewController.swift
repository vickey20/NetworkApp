//
//  ViewController.swift
//  NetworkApp
//
//  Created by Vikram Gupta on 10/23/18.
//  Copyright © 2018 Vikram Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var contactsTableView: UITableView!
    private var contacts = [[String: AnyObject]]()
    
    private var viewmodel = ContactsViewModel(dataService: DataService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        fetchContacts()
    }

    func fetchContacts() {
        viewmodel.fetchContacts()
        viewmodel.didFinishFetch = {
            self.contacts = self.viewmodel.contacts!
            self.contactsTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "contacts_cell") as? ContactsCell {
            let row = contacts[indexPath.row]
            let contact = Contact(name: row["name"] as! String, email: row["email"] as! String)
            cell.updateView(withContact: contact)
            return cell
        } else {
            return ContactsCell()
        }
    }
}
