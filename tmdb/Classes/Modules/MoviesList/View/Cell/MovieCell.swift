//
//  MovieCell.swift
//  DribbbleTest
//
//  Created by dede.exe on 25/01/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//
import UIKit

//MARK: - Interfaces
protocol MovieCellDataSource
{
    var movieImage       : String? { get }
    var movieTitle       : String? { get }
    var movieViewsCount  : String? { get }
}

protocol MovieCellDelegate
{
    var movieTitleLabelFont      : UIFont { get }
    var movieTitleLabelColor     : UIColor { get }
    var movieViewLabelFont       : UIFont { get }
    var movieViewLabelColor      : UIColor { get }
}

extension MovieCellDelegate
{
    var movieTitleLabelFont      : UIFont    { return UIFont.titleText }
    var movieTitleLabelColor     : UIColor   { return UIColor.movieImageTitle }
    var movieViewLabelFont       : UIFont    { return UIFont.titleText }
    var movieViewLabelColor      : UIColor   { return UIColor.movieImageTitle }
}

//MARK: - MovieCell Class
class MovieCell: UITableViewCell {

    @IBOutlet fileprivate weak var topImageView         : CachedImageView!
    @IBOutlet fileprivate weak var movieTitleLabel      : UILabel!
    @IBOutlet fileprivate weak var movieViewsLabel      : UILabel!
    @IBOutlet fileprivate weak var titleBarView         : UIView!
    
    fileprivate var dataSource                          : MovieCellDataSource?
    fileprivate var delegate                            : MovieCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(dataSource:MovieCellDataSource?, delegate:MovieCellDelegate?) {
        self.dataSource     = dataSource
        self.delegate       = delegate
        loadConfigurations()
    }
    
    func loadConfigurations()
    {
        configureTopImageView()
        configureTitleLabel()
        configureViewLabel()
        configureTitleBarView()
    }
    
}

//MARK: - Configurations 
extension MovieCell {
    
    func configureTitleBarView() {
        titleBarView.backgroundColor = UIColor.black
        titleBarView.alpha = 0.8
    }
    
    func configureTopImageView() {
        self.topImageView.loadImage(imageURL: dataSource?.movieImage)
    }
    
    func configureTitleLabel()
    {
        movieTitleLabel.text         = dataSource?.movieTitle
        movieTitleLabel.font         = delegate?.movieTitleLabelFont
        movieTitleLabel.textColor    = delegate?.movieTitleLabelColor
    }
    
    func configureViewLabel()
    {
        movieViewsLabel.text         = dataSource?.movieViewsCount
        movieViewsLabel.font         = delegate?.movieViewLabelFont
        movieViewsLabel.textColor    = delegate?.movieViewLabelColor
    }

}
