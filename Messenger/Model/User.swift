//
//  User.swift
//  Messenger
//
//  Created by XP India on 03/08/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullName: String
    let email: String
    let profileImageURL: String?
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }
    
    var firstName: String {
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: fullName)
        return components?.givenName ?? fullName 
    }
}

extension User {
    static let MOCK_USER = User(fullName: "Surendra", email: "surendra@yopmail.com", profileImageURL: "profileImage")
}
