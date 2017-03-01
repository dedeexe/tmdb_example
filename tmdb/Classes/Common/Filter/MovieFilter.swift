//
//  MovieFilter.swift
//  tmdb
//
//  Created by dede.exe on 22/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public struct MovieFilter
{    
    private let entity : [Movie]
    
    public var movies : [Movie] {
        return entity
    }
    
    public init(movies:[Movie]) {
        entity = movies
    }
    
    public func filterBy(rating:Double) -> MovieFilter {
        let filteredItems = self.movies.filter { (movie) -> Bool in
            let voteAvarage = movie.vote_average ?? 0.0
            return voteAvarage >= rating
        }
        
        return MovieFilter(movies: filteredItems)
    }
}
