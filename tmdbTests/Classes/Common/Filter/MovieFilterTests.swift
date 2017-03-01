//
//  MovieFilterTests.swift
//  tmdb
//
//  Created by dede.exe on 01/03/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import XCTest
@testable import tmdb

class MovieFilterTests: XCTestCase {
    
    var movies : [Movie] = []
    
    override func setUp() {
        super.setUp()
        
        movies = []
        
        for n in 1...10
        {
            let movie = Movie()
            movie.title = "Movie \(n)"
            movie.vote_average = Double(n)
            movies.append(movie)
        }
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFilterCount() {
        let filter = MovieFilter(movies: movies)
        XCTAssertEqual(0, filter.filterBy(rating: 10.1).movies.count)
        XCTAssertEqual(1, filter.filterBy(rating: 10.0).movies.count)
        XCTAssertEqual(2, filter.filterBy(rating: 9.0).movies.count)
        XCTAssertEqual(4, filter.filterBy(rating: 7.0).movies.count)
        XCTAssertEqual(4, filter.filterBy(rating: 6.2).movies.count)
        XCTAssertEqual(6, filter.filterBy(rating: 5.0).movies.count)
        XCTAssertEqual(5, filter.filterBy(rating: 5.2).movies.count)
    }
    
    func testFilterNullAverageValue() {
        let movie = Movie()
        movie.title = "Null Average Movie"
        movie.vote_average = nil
        
        let filter = MovieFilter(movies: [movie])
        XCTAssertEqual(0, filter.filterBy(rating: 0.1).movies.count)
    }
    
}
