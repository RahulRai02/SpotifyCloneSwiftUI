//
//  User.swift
//  SpotifyClone
//
//  Created by Rahul Rai on 10/10/24.
//

import Foundation


struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable, Identifiable{
    let id: Int
    let firstName, lastName : String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height, weight: Double
    
}
