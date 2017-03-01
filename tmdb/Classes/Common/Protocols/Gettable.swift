//
//  Gettable.swift
//  tmdb
//
//  Created by dede.exe on 21/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public protocol Gettable {
    associatedtype DataType
    func get(completion: @escaping (FuckingResult<DataType>) -> Void)
}
