//
//  Follower.swift
//  GitHubFollowers
//
//  Created by Matthew Tseng on 2021-12-05.
//

import Foundation

struct Follower: Codable, Hashable {
    let login: String
    let avatarUrl: String
}
