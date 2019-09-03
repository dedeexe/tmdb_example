//
//  FuckTheRest.swift
//  FuckTheRest
//
//  Created by Fabrício Santos on 1/24/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation


open class FuckTheRest {
    
    fileprivate init() {}
    
    static public func get(_ url:String) -> FuckingRequest {
        let request = FuckingRequest(url: url, method:FuckingMethod.get)
        return request
    }
    
    static public func post(_ url:String) -> FuckingRequest {
        let request = FuckingRequest(url: url, method:FuckingMethod.post)
        return request
    }
    
    static public func put(_ url:String) -> FuckingRequest {
        let request = FuckingRequest(url: url, method:FuckingMethod.put)
        return request
    }
    
    static public func delete(_ url:String) -> FuckingRequest {
        let request = FuckingRequest(url: url, method:FuckingMethod.delete)
        return request
    }
    
    static public func patch(_ url:String) -> FuckingRequest {
        let request = FuckingRequest(url: url, method:FuckingMethod.patch)
        return request
    }
}
