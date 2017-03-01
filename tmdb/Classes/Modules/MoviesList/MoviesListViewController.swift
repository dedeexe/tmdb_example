//
//  MoviesListViewController.swift
//  tmdb
//
//  Created by dede.exe on 21/02/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//
import UIKit

class MoviesListViewController: UIViewController
{
    @IBOutlet fileprivate weak var tableView : UITableView!
    
    fileprivate var movies          : [Movie] = []
    fileprivate var loadingView     : LoadingView?
    fileprivate var eventHandler    : MoviesListModule?
    fileprivate var refreshControl  : UIRefreshControl?
    fileprivate var page            : Int = 1
    
    fileprivate let justOneSection  = 1
    fileprivate let cellName        = String(describing: MovieCell.self)
    
    public init() {
        let nibName = String(describing: MoviesListViewController.self)
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadConfigurations()
        eventHandler?.getMovies()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configure(eventHandler:MoviesListModule?) {
        self.eventHandler = eventHandler
    }
    
    func loadConfigurations() {
        configureView()
        configureTableView()
        configurePullRefresh()
        MovieListEnvironment.shared.configure(targetView: self)
    }
}


//MARK: - ShotListView Interface
extension MoviesListViewController : MoviesListView
{
    func show(movies: [Movie]) {
        self.movies = movies
        
        DispatchQueue.main.async {[unowned self] in
            self.reloadData()
        }
    }
    
    func showLoading() {
        if let _ = self.loadingView {
            return
        }
        
        DispatchQueue.main.async { [unowned self] in
            
            let nib = UINib(nibName: String(describing: LoadingView.self), bundle: nil)
            guard let instantiatedView = nib.instantiate(withOwner: self, options: nil).first as? LoadingView else {
                return
            }
            
            self.loadingView = instantiatedView
            self.loadingView?.frame = self.tableView.frame
            self.view.addSubview(self.loadingView!)
        }
    }
    
    func hideLoading() {
        guard let loadingView = self.loadingView else {
            return
        }
        
        DispatchQueue.main.async { [unowned self] in
            loadingView.removeFromSuperview()
            self.loadingView = nil
        }
    }
}


//MARK: - Configurations
extension MoviesListViewController {
    func registerCell() {
        let nib = UINib(nibName: cellName, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: cellName)
    }
    
    func configureView() {
        navigationItem.title = "Lista de Filmes"
    }
    
    func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = UITableViewAutomaticDimension
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.separatorColor = UIColor.clear
        self.tableView.separatorStyle = .none
        registerCell()
    }
    
    func configurePullRefresh() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(getLatestMovies), for: .valueChanged)
        tableView.addSubview(refreshControl!)
    }
}

//MARK: - Helper
extension MoviesListViewController {
    func reloadData() {
        tableView.reloadData()
        refreshControl?.endRefreshing()
        
        DispatchQueue.main.async { [unowned self] in
            self.eventHandler?.setNeedsUpdate()
        }
    }
}

//MARK: - Actions
extension MoviesListViewController {
    func getLatestMovies(sender:UIRefreshControl) {
        self.eventHandler?.getFirstPage()
    }
}

//MARK: - TableView Functions
extension MoviesListViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return justOneSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let cell = MovieCellFactory(movie: movie, tableView: tableView).create()
        cell.selectionStyle = .none
        return cell
    }
}

extension MoviesListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventHandler?.showDetail(movie: movies[indexPath.row])
    }
}
