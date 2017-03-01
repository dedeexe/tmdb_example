//
//  ShotCellFactory.swift
//  DribbbleTest
//
//  Created by dede.exe on 26/01/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

class MovieCellFactory : AbstractFactory {
    
    typealias DataType = MovieCell
    
    private let movie : Movie
    private let tableView : UITableView
    
    init(movie:Movie, tableView:UITableView) {
        self.movie      = movie
        self.tableView  = tableView
    }
    
    func create() -> DataType
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let viewModel = MovieCellViewModel(movie: movie)
        cell.configure(dataSource: viewModel, delegate: viewModel)
        return cell
    }
}
