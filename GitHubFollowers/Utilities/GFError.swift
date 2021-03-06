//
//  GFError.swift
//  GitHubFollowers
//
//  Created by Matthew Tseng on 2021-12-07.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server is invalid. Please try again."
    case unableToFavourite = "There was an error favouriting this user. Please try again."
    case alreadyFavourited = "You've already favourited this user."
}
