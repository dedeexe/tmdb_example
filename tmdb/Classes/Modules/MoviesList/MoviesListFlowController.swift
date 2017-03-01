//
//  MoviesListFlowController.swift
//  tmdb
//
//  Created by dede.exe on 23/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

public class MoviesListFlowController : MoviesListRoute {
    
    private weak var viewController : UIViewController?
    
    public init(viewController : UIViewController?) {
        self.viewController = viewController
    }
    
    public func showMovieDetail(movie: Movie)
    {
        let destinationVC = MovieDetailViewController()
        MovieDetailEnvironment.shared.configure(movie: movie, targetView: destinationVC)
        viewController?.present(destinationVC, animated: true, completion: nil)
    }
    
}
