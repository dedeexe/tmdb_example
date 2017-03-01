//
//  MovieDetailViewControllerTest.swift
//  tmdb
//
//  Created by dede.exe on 01/03/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import XCTest
@testable import tmdb

class MovieDetailViewControllerTest: XCTestCase {
    
    var movie : Movie = Movie()
    
    static var configuredCloseButton       : Bool = false
    static var configuredBackgorundImage   : Bool = false
    static var configuredPosterImage       : Bool = false
    static var configuredMovieTitle        : Bool = false
    static var configuredMovieDetail       : Bool = false
    static var configuredRating            : Bool = false
    static var configuredRatingIcon        : Bool = false
    static var configuredLaunchingIcon     : Bool = false
    static var configuredYear              : Bool = false
    
    func setUpMovie() {
        self.movie = Movie()
        movie.title = "Test Movie"
        movie.release_date = "2020-07-07"
        movie.backdrop_path = "backgrop"
        movie.overview = "A good movie"
        movie.vote_average = 9.5
        movie.poster_path = "poster"
    }
    
    func setUpConfigurations() {
        MovieDetailViewControllerTest.configuredCloseButton       = false
        MovieDetailViewControllerTest.configuredBackgorundImage   = false
        MovieDetailViewControllerTest.configuredPosterImage       = false
        MovieDetailViewControllerTest.configuredMovieTitle        = false
        MovieDetailViewControllerTest.configuredMovieDetail       = false
        MovieDetailViewControllerTest.configuredRating            = false
        MovieDetailViewControllerTest.configuredRatingIcon        = false
        MovieDetailViewControllerTest.configuredLaunchingIcon     = false
        MovieDetailViewControllerTest.configuredYear              = false
    }
    
    override func setUp() {
        super.setUp()
        setUpMovie()
        setUpConfigurations()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOutletsLink() {
        let viewController = MockMovieDetailViewController()
        viewController.show(movie: self.movie)
        
        XCTAssertNil(viewController.backImageView)
        XCTAssertNil(viewController.closeButton)
        XCTAssertNil(viewController.posterImageView)
        XCTAssertNil(viewController.textDetail)
        XCTAssertNil(viewController.labelTitle)
        XCTAssertNil(viewController.labelRating)
        XCTAssertNil(viewController.labelRatingIcon)
        XCTAssertNil(viewController.labelLaunchIcon)
        XCTAssertNil(viewController.labelLaunchYear)
        
        let _ = viewController.view

        XCTAssertNotNil(viewController.backImageView)
        XCTAssertNotNil(viewController.closeButton)
        XCTAssertNotNil(viewController.posterImageView)
        XCTAssertNotNil(viewController.textDetail)
        XCTAssertNotNil(viewController.labelTitle)
        XCTAssertNotNil(viewController.labelRating)
        XCTAssertNotNil(viewController.labelRatingIcon)
        XCTAssertNotNil(viewController.labelLaunchIcon)
        XCTAssertNotNil(viewController.labelLaunchYear)
        
    }
    
    func testConfigurations() {
        let viewController = MockMovieDetailViewController()
        viewController.show(movie: self.movie)
        let _ = viewController.view
        
        XCTAssertTrue(MovieDetailViewControllerTest.configuredBackgorundImage)
        XCTAssertTrue(MovieDetailViewControllerTest.configuredPosterImage)
        XCTAssertTrue(MovieDetailViewControllerTest.configuredCloseButton)
        XCTAssertTrue(MovieDetailViewControllerTest.configuredMovieTitle)
        XCTAssertTrue(MovieDetailViewControllerTest.configuredMovieDetail)
        XCTAssertTrue(MovieDetailViewControllerTest.configuredRating)
        XCTAssertTrue(MovieDetailViewControllerTest.configuredRatingIcon)
        XCTAssertTrue(MovieDetailViewControllerTest.configuredLaunchingIcon)
        XCTAssertTrue(MovieDetailViewControllerTest.configuredYear)
    }
}


//MARK: Mocking class
class MockMovieDetailViewController : MovieDetailViewController
{
    override func configureBackgorundImage() {
        //Don't call Super constructor
        print("---> configureBackgorundImage Called")
        MovieDetailViewControllerTest.configuredBackgorundImage = true
    }
    
    override func configurePosterImage() {
        //Don't call Super constructor 
        print("---> configurePosterImage Called")
        MovieDetailViewControllerTest.configuredPosterImage = true
    }
    
    override func configureCloseButton() {
        super.configureCloseButton()
        MovieDetailViewControllerTest.configuredCloseButton = true
    }
    
    override func configureMovieTitle() {
        super.configureMovieTitle()
        MovieDetailViewControllerTest.configuredMovieTitle = true
    }
    
    override func configureMovieDetail() {
        super.configureMovieDetail()
        MovieDetailViewControllerTest.configuredMovieDetail = true
    }
    
    override func configureRating() {
        super.configureRating()
        MovieDetailViewControllerTest.configuredRating = true
    }
    
    override func configureRatingIcon() {
        super.configureRatingIcon()
        MovieDetailViewControllerTest.configuredRatingIcon = true
    }
    
    override func configureLaunchingIcon() {
        super.configureLaunchingIcon()
        MovieDetailViewControllerTest.configuredLaunchingIcon = true
    }
    
    override func configureYear() {
        super.configureYear()
        MovieDetailViewControllerTest.configuredYear = true
    }
}
