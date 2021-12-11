//
//  GFButton.swift
//  GitHubFollowers
//
//  Created by Matthew Tseng on 2021-12-02.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        // NOTE: Call everything in its parent, and then call this, then proceed with our custom code
        configure()
    }
    
    // NOTE: Handles initialization for storyboards
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    func set(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        // NOTE: Download SemanticUI repo shows the difference between system fonts/colours
        
        translatesAutoresizingMaskIntoConstraints = false // To enable AutoLayout
    }
}
