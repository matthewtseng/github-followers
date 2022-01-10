//
//  UITableView+Ext.swift
//  GitHubFollowers
//
//  Created by Matthew Tseng on 2022-01-09.
//

import UIKit

extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
