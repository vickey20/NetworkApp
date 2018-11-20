//
//  Contact.swift
//  NetworkApp
//
//  Created by Vikram Gupta on 11/8/18.
//  Copyright © 2018 Vikram Gupta. All rights reserved.
//

import Foundation
struct Contact {
    private(set) public var name: String!
    private(set) public var email: String!
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}
