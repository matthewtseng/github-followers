//
//  GFAlertContainerView.swift
//  GitHubFollowers
//
//  Created by Matthew Tseng on 2021-12-03.
//

import UIKit

class GFAlertContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
}
