//
//  MoviesListview.swift
//  tmdb
//
//  Created by dede.exe on 21/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public protocol MoviesListView : class {
    func show(movies:[Movie])
    func showLoading()
    func hideLoading()
}
