//
//  MainRoute.swift
//  tmdb
//
//  Created by dede.exe on 23/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

public class AppMain
{
    fileprivate var window : UIWindow!
    
    public init(using window : UIWindow?) {
        self.window = window
    }
    
    public func start()
    {
        initializeScreen()
    }
    
}


//MARK: - Screen Initialization
public extension AppMain {
    
    fileprivate func initializeScreen()
    {
        var rootViewController : UIViewController?
        rootViewController = startOnMovieList(using: self.window)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    fileprivate func startOnMovieList(using window:UIWindow?) -> UINavigationController
    {
        let viewController = MoviesListViewController()
        let navigation = UINavigationController(rootViewController: viewController)
        return navigation
    }
}
