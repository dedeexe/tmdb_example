//
//  MovieCellViewModel.swift
//  DribbbleTest
//
//  Created by dede.exe on 26/01/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

public struct MovieCellViewModel {
    fileprivate var movie           : Movie
    
    init(movie:Movie) {
        self.movie = movie
    }
}

extension  MovieCellViewModel : MovieCellDataSource, MovieCellDelegate
{
    var movieImage: String? {
        let url = AppConfig.baseImgURL + (movie.poster_path ?? "")
        return url
    }
    
    var movieTitle: String? {
        return movie.title
    }
    
    var movieViewsCount: String? {
        let countText = String(format: "%.1f", movie.vote_average ?? 0)
        let text = UnicodeIcon.star.rawValue.appending(" ").appending(countText)
        return text
    }
}
