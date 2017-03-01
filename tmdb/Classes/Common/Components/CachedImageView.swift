//
//  CachedImageView.swift
//  DribbbleTest
//
//  Created by dede.exe on 26/01/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

protocol CachedImageViewDelegate {
    
}

class CachedImageView: UIImageView {
    
    fileprivate var storedPlaceHolder: UIImage?
    
    var placeholderImage : UIImage? {
        didSet {
            storedPlaceHolder = placeholderImage
            setPlaceholder()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func loadImage(imageURL:String?)
    {
        self.image = storedPlaceHolder
        guard let imageURL = imageURL, let url = URL(string:imageURL) else {
            return
        }
        
        downloadImage(url:url)
    }
    
    fileprivate func downloadImage(url:URL) {
        DispatchQueue.global().async {[unowned self] in
            do {
                let data = try Data(contentsOf: url)
                guard let imageRender = UIImage(data: data) else {
                    self.setPlaceholder()
                    return
                }
                
                DispatchQueue.main.async { [unowned self] in
                    self.image = imageRender
                }
            }
            catch {
                self.setPlaceholder()
            }
            
        }
    }
    
    fileprivate func setPlaceholder() {
        DispatchQueue.main.async { [unowned self] in
            self.image = self.storedPlaceHolder
        }
    }
    
}
