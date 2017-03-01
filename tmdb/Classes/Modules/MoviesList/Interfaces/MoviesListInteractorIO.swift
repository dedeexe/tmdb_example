//
//  MoviesListInteractor.swift
//  tmdb
//
//  Created by dede.exe on 21/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation
protocol MoviesListInteractorInput : class {
    func requestMovies()

}

protocol MoviesListInteractorOutput : class {
    func fecth(movies:[Movie])
}
