//
//  NetworkAppTests.swift
//  NetworkAppTests
//
//  Created by Vikram Gupta on 11/8/18.
//  Copyright © 2018 Vikram Gupta. All rights reserved.
//

import XCTest
import Foundation
@testable import NetworkApp
import Alamofire

class NetworkAppTests: XCTestCase {
    var mockDataService: MockDataService!
    var sut: ContactsViewModel!

    override func setUp() {
        super.setUp()
        mockDataService = MockDataService()
        sut = ContactsViewModel(dataService: mockDataService)
    }

    override func tearDown() {
        sut = nil
        mockDataService = nil
        super.tearDown()
    }

    func testFetchContactsCalled() {
        sut.fetchContacts()
        
        XCTAssert(mockDataService.isFetchContactsCalled)
    }
    
    func testFetchContactsFail() {
        let error = "Failed to fetch contacts"
       
        sut.fetchContacts()
        
        mockDataService.fetchFail(error: error)
        
        XCTAssertEqual(sut.error, error)
    }
    
    func testFetchContactsSuccess() {
        mockDataService.contacts = [["name": "John", "email": "john@xyz.com"], ["name": "Tony", "email": "tony@xyz.com"]] as [[String : AnyObject]]
        
        sut.fetchContacts()
        
        mockDataService.fetchSuccess()
        
        XCTAssertEqual(sut.contacts?.count, mockDataService.contacts.count)
    }
}
