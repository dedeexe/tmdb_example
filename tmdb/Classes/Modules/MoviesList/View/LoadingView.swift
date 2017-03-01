//
//  LoadingView.swift
//  DribbbleTest
//
//  Created by dede.exe on 26/01/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

class LoadingView: UIView
{
    @IBOutlet weak var indicator : UIActivityIndicatorView!
    
    override func awakeFromNib() {
        indicator.startAnimating()
    }
}
