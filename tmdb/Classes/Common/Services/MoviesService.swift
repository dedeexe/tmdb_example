//
//  MoviesService.swift
//  tmdb
//
//  Created by dede.exe on 21/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public struct MoviesService {}

extension MoviesService : Gettable
{
    public typealias DataType = Data

    public func get(completion: @escaping (FuckingResult<DataType>) -> Void)
    {
        let url = AppConfig.baseURL.appending("/movie/upcoming")
        
        FuckTheRest.get(url)
            .addParameter("api_key", value: AppConfig.token)
            .response { (result) in
                switch result {
                    case .error(let err):
                        completion(FuckingResult<DataType>.error(err))
                    case .success(let code, let resultData):
                        completion(FuckingResult<DataType>.success(code, resultData))
                }
            }
    }
}
