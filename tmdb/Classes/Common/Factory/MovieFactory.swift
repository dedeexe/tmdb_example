//
//  MovieFactory.swift
//  tmdb
//
//  Created by dede.exe on 22/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

class MovieFactory : AbstractFactory {
    
    private let item : [String:Any]
    
    init(jsonElement:[String:Any]) {
        self.item = jsonElement
    }
    
    func create() -> Movie
    {
        let movie    = Movie()
        
        movie.id                = item["id"] as? Int
        movie.poster_path       = item["poster_path"] as? String
        movie.adult             = item["adult"] as? Bool
        movie.overview          = item["overview"] as? String
        movie.release_date      = item["release_date"] as? String
        movie.genre_ids         = item["genre_ids"] as? [Int]
        movie.original_title    = item["original_title"] as? String
        movie.original_language = item["original_language"] as? String
        movie.title             = item["title"] as? String
        movie.backdrop_path     = item["backdrop_path"] as? String
        movie.popularity        = item["popularity"] as? Double
        movie.vote_count        = item["vote_count"] as? Int
        movie.video             = item["video"] as? Bool
        movie.vote_average      = item["vote_average"] as? Double
        
        return movie
    }
}
