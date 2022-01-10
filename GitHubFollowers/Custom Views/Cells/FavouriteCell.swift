//
//  FavouriteCell.swift
//  GitHubFollowers
//
//  Created by Matthew Tseng on 2021-12-17.
//

import UIKit

class FavouriteCell: UITableViewCell {

    static let reuseIdentifier = "FavouriteCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 26)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(favourite: Follower) {
        usernameLabel.text = favourite.login
        avatarImageView.downloadImage(from: favourite.avatarUrl)
    }
    
    private func configure() {
        let padding: CGFloat = 12
        
        addSubviews(avatarImageView, usernameLabel)
        
        accessoryType = .disclosureIndicator
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
