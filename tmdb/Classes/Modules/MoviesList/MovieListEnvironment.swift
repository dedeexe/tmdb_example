//
//  MovieListEnvironment.swift
//  tmdb
//
//  Created by dede.exe on 23/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

class MovieListEnvironment {
    
    static let shared : MovieListEnvironment = {
        let instance = MovieListEnvironment()
        return instance
    } ()
    
    private init() {}
    
    func configure(targetView:MoviesListViewController)
    {
        let presenter   = MoviesListPresenter()
        let interactor  = MoviesListInteractor()
        let router      = MoviesListFlowController(viewController: targetView)
        
        interactor.configure(output: presenter)
        presenter.configure(targetView: targetView, interactor: interactor, route: router)
        targetView.configure(eventHandler: presenter)
    }
    
}
