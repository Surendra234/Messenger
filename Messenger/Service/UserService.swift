//
//  UserService.swift
//  Messenger
//
//  Created by XP India on 05/08/23.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return}
        let snapshot = try await FirestoreConstants.UserCollection.document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("DEBUG :- current user in service is \(String(describing: currentUser))")
    }
    
    static func fetchAllUser(limit: Int? = nil) async throws -> [User] {
        let query = FirestoreConstants.UserCollection
        if let limit { query.limit(to: limit) }
        let snapshot = try await FirestoreConstants.UserCollection.getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self)})
    }
    
    static func fetchUser(withUid uid: String, completion: @escaping (User) -> Void) {
        FirestoreConstants.UserCollection.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return}
            completion(user)
        }
    }
}
