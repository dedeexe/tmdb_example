//
//  MoviesListInteractor.swift
//  tmdb
//
//  Created by dede.exe on 21/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

class MoviesListInteractor
{
    fileprivate weak var output : MoviesListInteractorOutput?
    
    lazy var storage = DataStorage(filename: AppConfig.moviesStoreFile)
    
    func configure(output:MoviesListInteractorOutput?) {
        self.output = output
    }
}

extension MoviesListInteractor : MoviesListInteractorInput {
    func requestMovies()
    {
        let service = MoviesService()
        service.get { [unowned self] (result) in
            switch(result) {
                case .error(_):
                    guard let restoredShots = self.storage.restore() else {
                        self.output?.fecth(movies: [])
                        return
                    }
                    
                    let extractedShots = extractMovies(from: restoredShots)
                    self.output?.fecth(movies: extractedShots)
                    
                case .success(_ , let resultShots):
                    let _ = self.storage.save(data: resultShots)
                    let extractedShots = extractMovies(from: resultShots)
                    self.output?.fecth(movies: extractedShots)
            }
        }
    }
}


//MARK: - Helpers
fileprivate func extractMovies(from input:Data) -> [Movie]
{
    var jsonResult : [String:Any] = [:]
    
    do {
        jsonResult = try JSONSerialization.jsonObject(with: input,
                                                      options: JSONSerialization.ReadingOptions.mutableLeaves) as! [String:Any]
    } catch {
        return []
    }
    
    let items = jsonResult["results"] as? [[String:Any]] ?? []
    
    let movies = items.flatMap{ (movieItem) -> Movie in
        return MovieFactory(jsonElement: movieItem).create()
    }
    
    return movies
}
