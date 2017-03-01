//
//  DataStorageTest.swift
//  tmdb
//
//  Created by dede.exe on 01/03/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import XCTest
@testable import tmdb

class DataStorageTest: XCTestCase {
    
    let filename    = "Test.store"
    var dataString  = ""
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        var numbers : [String] = []
        for _ in 1...20 {
            numbers.append(String(Int(arc4random_uniform(1000))))
        }
        
        dataString = numbers.joined(separator:" - ")
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSaveStorage() {
        let data = dataString.data(using: .utf8)
        let storage = DataStorage(filename: filename)
        let result = storage.save(data: data)
        
        XCTAssertTrue(result)
    }

    func testRestoreStorage() {
        let data = dataString.data(using: .utf8)
        let storage = DataStorage(filename: filename)
        let _ = storage.save(data: data)
        
        let result = String(data: (storage.restore() ?? Data()), encoding: .utf8)
        XCTAssertEqual(result, dataString)
    }

    
}
