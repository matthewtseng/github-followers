//
//  UIView+Ext.swift
//  GitHubFollowers
//
//  Created by Matthew Tseng on 2022-01-04.
//

import UIKit

extension UIView {
    
    // Variadic function to add multiple views in a line
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
