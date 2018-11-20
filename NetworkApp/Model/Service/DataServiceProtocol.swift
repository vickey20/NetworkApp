//
//  DataServiceProtocol.swift
//  NetworkApp
//
//  Created by Vikram Gupta on 11/19/18.
//  Copyright © 2018 Vikram Gupta. All rights reserved.
//

import Foundation
protocol DataServiceProtocol {
    func fetchContacts(completion: @escaping ([[String: AnyObject]]?, String?) -> ())
}
