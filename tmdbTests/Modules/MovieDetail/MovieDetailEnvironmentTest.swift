//
//  MovieDetailEnvironmentTest.swift
//  tmdb
//
//  Created by dede.exe on 01/03/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import XCTest
@testable import tmdb

class MovieDetailEnvironmentTest: XCTestCase {
    
    static var didReachShow : Bool = false
    
    override func setUp() {
        super.setUp()
        MovieDetailEnvironmentTest.didReachShow = false
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConfigureEnvironment() {
        let mockVC = MockMovieDetailViewController()
        MovieDetailEnvironment.shared.configure(movie: Movie(), targetView: mockVC)
        
        XCTAssertTrue(MovieDetailEnvironmentTest.didReachShow)
    }
    
    
    //Mock Class
    class MockMovieDetailViewController : MovieDetailViewController {
        override func show(movie: Movie) {
            MovieDetailEnvironmentTest.didReachShow = true
        }
    }
    
}


