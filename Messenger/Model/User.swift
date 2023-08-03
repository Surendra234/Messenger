//
//  User.swift
//  Messenger
//
//  Created by XP India on 03/08/23.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullName: String
    let email: String
    let profileImageURL: String
}

extension User {
    static let MOCK_USER = User(fullName: "Surendra", email: "surendra@yopmail.com", profileImageURL: "profileImage")
}
