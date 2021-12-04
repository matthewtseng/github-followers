//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Matthew Tseng on 2021-12-04.
//

import UIKit

// NOTE: Subclass is for when you want a subset of "buttons" to have a certain behaviour,
// Extensions are when you want all "buttons" to have the behaviour

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
