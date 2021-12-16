//
//  Date+Ext.swift
//  GitHubFollowers
//
//  Created by Matthew Tseng on 2021-12-16.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
