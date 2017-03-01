//
//  Movie.swift
//  tmdb
//
//  Created by dede.exe on 21/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public class Movie {
    
    public init() {}
    
    public var id                   : Int?
    
    public var poster_path          : String?
    public var adult                : Bool?
    public var overview             : String?
    public var release_date         : String?
    public var genre_ids            : [Int]?
    
    public var original_title       : String?
    public var original_language    : String?
    public var title                : String?
    public var popularity           : Double?
    public var count                : Int?
    public var video                : Bool?
    public var vote_average         : Double?
    public var vote_count           : Int?

    public var backdrop_path        : String?

}


