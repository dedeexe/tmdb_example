//
//  MovieDetailViewController.swift
//  tmdb
//
//  Created by dede.exe on 23/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var backImageView    : CachedImageView!
    @IBOutlet weak var closeButton      : UIButton!
    @IBOutlet weak var posterImageView  : CachedImageView!
    @IBOutlet weak var textDetail       : UITextView!
    @IBOutlet weak var labelTitle       : UILabel!
    @IBOutlet weak var labelRating      : UILabel!
    @IBOutlet weak var labelRatingIcon  : UILabel!
    @IBOutlet weak var labelLaunchIcon  : UILabel!
    @IBOutlet weak var labelLaunchYear  : UILabel!

    
    fileprivate var movie : Movie?
    
    public init() {
        let nibName = String(describing: MovieDetailViewController.self)
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadConfigurations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadConfigurations() {
        configureCloseButton()
        configureBackgorundImage()
        configurePosterImage()
        configureMovieTitle()
        configureMovieDetail()
        configureRating()
        configureRatingIcon()
        configureLaunchingIcon()
        configureYear()
    }

    //MARK: -- Actions
    func closeMovie(sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func show(movie: Movie) {
        self.movie = movie
    }
}

//MARK: - Configurations
extension MovieDetailViewController {
    func configureCloseButton() {
        //closeButton.setTitle(UnicodeIcon.close.rawValue, for: .normal)
        closeButton.addTarget(self, action: #selector(closeMovie), for: .touchUpInside)
    }
    
    func configurePosterImage() {
        let urlImage = AppConfig.baseImgURL + (movie?.poster_path ?? "")
        posterImageView.loadImage(imageURL: urlImage)
    }
    
    func configureBackgorundImage() {
        let urlImage = AppConfig.baseImgURL + (movie?.backdrop_path ?? "")
        backImageView.loadImage(imageURL: urlImage)
    }
    
    func configureMovieDetail() {
        textDetail.text = movie?.overview
        
        textDetail.font = UIFont.normalText
    }
    
    func configureMovieTitle() {
        labelTitle.text = movie?.title
        labelTitle.font = UIFont.titleText
    }
    
    func configureRatingIcon() {
        labelRatingIcon.text = UnicodeIcon.star.rawValue
        labelRatingIcon.layer.cornerRadius = 5.0
        labelRatingIcon.layer.masksToBounds = true
    }

    func configureRating() {
        let ratingString = String(format: "%.1f", movie?.vote_average ?? 0.0)
        labelRating.text = ratingString
        
        labelRating.font = UIFont.normalText
    }
    
    func configureYear() {
        let movieYear = movie?.release_date ?? ""
        let yearPieces = movieYear.components(separatedBy: "-")
        labelLaunchYear.text = yearPieces.first ?? "Desconhecido"
        
        labelLaunchYear.font = UIFont.normalText
    }
    
    func configureLaunchingIcon() {
        labelLaunchIcon.text = UnicodeIcon.circle.rawValue
        labelLaunchIcon.layer.cornerRadius = 5.0
        labelLaunchIcon.layer.masksToBounds = true
    }

}


