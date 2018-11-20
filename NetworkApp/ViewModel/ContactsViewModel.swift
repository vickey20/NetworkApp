//
//  ContactsViewModel.swift
//  NetworkApp
//
//  Created by Vikram Gupta on 11/8/18.
//  Copyright © 2018 Vikram Gupta. All rights reserved.
//

import Foundation
class ContactsViewModel {
    private(set) public var error: String?
    private(set) public var contacts: [[String: AnyObject]]? {
        didSet {
            self.didFinishFetch?()
        }
    }
    
    private var dataService: DataServiceProtocol
    var didFinishFetch: (() -> ())?
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    func fetchContacts() {
        dataService.fetchContacts(completion: { (contacts, error) in
            if let error = error {
                self.error = error
                return
            }
            self.contacts = contacts!
        })
    }
}
