//
//  MoviesListModule.swift
//  tmdb
//
//  Created by dede.exe on 21/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public protocol MoviesListModule : class {
    func getMovies()
    func getFirstPage()
    func setNeedsUpdate()
    func showDetail(movie:Movie)
}
