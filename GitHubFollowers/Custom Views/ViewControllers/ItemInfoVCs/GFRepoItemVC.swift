//
//  GFRepoItemVC.swift
//  GitHubFollowers
//
//  Created by Matthew Tseng on 2021-12-10.
//

import UIKit

// Subclass of GFItemInfoVC, inherits properties
class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
}
