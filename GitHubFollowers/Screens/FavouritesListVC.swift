//
//  FavouritesListVC.swift
//  GitHubFollowers
//
//  Created by Matthew Tseng on 2021-12-02.
//

import UIKit

class FavouritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        PersistenceManager.retrieveFavourites { result in
            switch result {
            case .success(let favourites):
                print(favourites)
            case .failure(let error):
                break
            }
        }
    }
}
