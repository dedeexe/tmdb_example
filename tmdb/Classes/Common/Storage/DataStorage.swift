//
//  DataStorage.swift
//  tmdb
//
//  Created by dede.exe on 01/03/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

class DataStorage {
    
    private var filepath : String = ""
    private var filename : String = ""
    
    init(filename:String) {
        self.filepath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
        self.filename = filename
    }
    
    func save(data:Data?) -> Bool {
        
        guard !filepath.isEmpty else {
            return false
        }
        
        guard let data = data else {
            return false
        }
        
        let fullPath = filepath + "/" + filename
        let url = URL(fileURLWithPath: fullPath)

        guard let _ = try? data.write(to: url) else {
            return false
        }
        
        return true
    }
    
    func restore() -> Data? {
        
        guard !filepath.isEmpty else {
            return nil
        }
        
        let fullPath = filepath + "/" + filename
        let url = URL(fileURLWithPath: fullPath)
        
        if let result = try? Data(contentsOf: url) {
            return result
        }
        
        return nil
    }

}
