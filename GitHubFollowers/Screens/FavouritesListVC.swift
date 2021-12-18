//
//  FavouritesListVC.swift
//  GitHubFollowers
//
//  Created by Matthew Tseng on 2021-12-02.
//

import UIKit

class FavouritesListVC: UIViewController {
    
    let favouritesTableView = UITableView()
    var favourites: [Follower] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    // Need to update favourites here because ViewDidLoad only loads once, while we need favourites to update
    // Every time the view appears (if user goes to Search to favourite a user and then click onto Favourites tab
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavourites()
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favourites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureTableView() {
        view.addSubview(favouritesTableView)
        
        favouritesTableView.frame = view.bounds
        favouritesTableView.rowHeight = 80
        favouritesTableView.delegate = self
        favouritesTableView.dataSource = self
        
        favouritesTableView.register(FavouriteCell.self, forCellReuseIdentifier: FavouriteCell.reuseIdentifier)
    }
    
    func getFavourites() {
        PersistenceManager.retrieveFavourites { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let favourites):
                if favourites.isEmpty {
                    self.showEmptyStateView(with: "No Favourites?\nAdd one on the follower screen.", in: self.view)
                } else {
                    self.favourites = favourites
                    
                    // Need to reload data on the main thread
                    DispatchQueue.main.async {
                        self.favouritesTableView.reloadData()
                        
                        // Make sure the table view is showing on top of empty state (if it were to happen)
                        self.view.bringSubviewToFront(self.favouritesTableView)
                    }
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong!", message: error.rawValue, buttonTitle: "Okay")
            }
        }
    }
}

extension FavouritesListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favourites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favouritesTableView.dequeueReusableCell(withIdentifier: FavouriteCell.reuseIdentifier) as! FavouriteCell
        let favourite = favourites[indexPath.row]
        // Update name of favourite cell
        cell.set(favourite: favourite)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Grab favourite of the row that was tapped
        let favourite = favourites[indexPath.row]
        
        // Create VC and pass information
        let destVC = FollowerListVC()
        destVC.username = favourite.login
        destVC.title = favourite.login
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    // Swipe to delete function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let favourite = favourites[indexPath.row]
        favourites.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        
        PersistenceManager.updateWith(favourite: favourite, actionType: .remove) { [weak self] error in
            guard let self = self else { return }
            guard let error = error else { return } // Deletion was successful
            
            // Error while deleting
            self.presentGFAlertOnMainThread(title: "Unable to remove", message: error.rawValue, buttonTitle: "Okay")
        }
    }
}
