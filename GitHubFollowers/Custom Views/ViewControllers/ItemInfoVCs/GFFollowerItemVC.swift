//
//  GFFollowerItemVC.swift
//  GitHubFollowers
//
//  Created by Matthew Tseng on 2021-12-10.
//

import UIKit

// Subclass of GFItemInfoVC, inherits properties
class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
}
