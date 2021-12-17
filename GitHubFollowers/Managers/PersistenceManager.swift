//
//  PersistenceManager.swift
//  GitHubFollowers
//
//  Created by Matthew Tseng on 2021-12-16.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favourites = "favourites"
    }
    
    static func updateWith(favourite: Follower, actionType: PersistenceActionType, completion: @escaping (GFError?) -> Void) {
        retrieveFavourites { result in
            switch result {
            case .success(let favourites):
                // Create temporary array
                var retrievedFavourites = favourites
                
                // Perform correct action type
                switch actionType {
                case .add:
                    // Don't want to add a favourite if it's already a favourite
                    guard !retrievedFavourites.contains(favourite) else {
                        completion(.alreadyFavourited)
                        return
                    }
                    
                    retrievedFavourites.append(favourite)
                case .remove:
                    // Remove all where the login is the same as the favourite
                    retrievedFavourites.removeAll { $0.login == favourite.login }
                }
                
                // Return temporary array with the addition or deletion of favourite
                completion(save(favourites: retrievedFavourites))
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    // Retrieve the favourites in UserDefaults
    // Upon success returns [Follower], otherwise GFError
    // Need to retrieve it this way because we are using a custom object [Follower]
    static func retrieveFavourites(completion: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favouritesData = defaults.object(forKey: Keys.favourites) as? Data else {
            // For the first time accessing favourites
            completion(.success([]))
            return
        }
        
        // Similar to NetworkManager
        do {
            let decoder = JSONDecoder()
            let favourites = try decoder.decode([Follower].self, from: favouritesData)
            completion(.success(favourites))
        } catch {
            completion(.failure(.unableToFavourite))
        }
    }
    
    // Save favourites to UserDefaults
    // If successful, return nothing, else return an error
    static func save(favourites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavourites = try encoder.encode(favourites)
            defaults.setValue(encodedFavourites, forKey: Keys.favourites)
            return nil
        } catch {
            return .unableToFavourite
        }
    }
}
