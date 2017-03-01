//
//  AppStyle.swift
//  tmdb
//
//  Created by dede.exe on 21/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

import UIKit

fileprivate enum FontSize : CGFloat {
    case small      = 11
    case normal     = 13
    case big        = 17
}

fileprivate enum FontFamily : String {
    case Helvetica  = "HelveticaNeue"
}

extension UIFont {
    static var normalText   : UIFont { return UIFont(name: FontFamily.Helvetica.rawValue, size: FontSize.normal.rawValue)! }
    static var titleText    : UIFont { return UIFont(name: FontFamily.Helvetica.rawValue, size: FontSize.big.rawValue)! }
}

extension UIColor {
    static var normalText       : UIColor { return UIColor.black }
    static var movieImageTitle  : UIColor { return UIColor.white }
    static var movieAuthorTitle : UIColor { return UIColor.black }
}
