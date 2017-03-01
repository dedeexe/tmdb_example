//
//  MovieDetailEnvironment.swift
//  tmdb
//
//  Created by dede.exe on 23/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

class MovieDetailEnvironment {
    
    static let shared : MovieDetailEnvironment = {
        let instance = MovieDetailEnvironment()
        return instance
    } ()
    
    private init() {}
    
    func configure(movie:Movie, targetView:MovieDetailViewController) {
        targetView.show(movie: movie)
        targetView.navigationController?.pushViewController(targetView, animated: true)
    }
    
}
