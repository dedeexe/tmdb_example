//
//  MoviesListPresenter.swift
//  tmdb
//
//  Created by dede.exe on 21/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public class MoviesListPresenter  {
    fileprivate weak var targetView : MoviesListView?
    fileprivate var interactor : MoviesListInteractorInput?
    fileprivate var route      : MoviesListRoute?
    
    func configure(targetView:MoviesListView?) {
        self.targetView = targetView
    }
    
    func configure(interactor:MoviesListInteractorInput?) {
        self.interactor = interactor
    }
    
    func configure(route:MoviesListRoute?) {
        self.route = route
    }
    
    func configure(targetView:MoviesListView?, interactor:MoviesListInteractorInput?, route:MoviesListRoute?) {
        configure(targetView: targetView)
        configure(interactor: interactor)
        configure(route: route)
    }
}

extension MoviesListPresenter : MoviesListModule {
    
    public func getMovies() {
        self.targetView?.showLoading()
        self.interactor?.requestMovies()
    }
    
    public func getFirstPage() {
        self.interactor?.requestMovies()
    }
    
    public func setNeedsUpdate() {
        targetView?.hideLoading()
    }
    
    public func showDetail(movie: Movie) {
        route?.showMovieDetail(movie: movie)
    }
}


extension MoviesListPresenter : MoviesListInteractorOutput {
    public func fecth(movies: [Movie]) {
        let filteredMovies = MovieFilter(movies: movies).filterBy(rating: 5.0).movies
        targetView?.show(movies: filteredMovies)
        targetView?.hideLoading()
    }
}
