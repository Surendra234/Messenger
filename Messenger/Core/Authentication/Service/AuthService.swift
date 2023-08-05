//
//  AuthService.swift
//  Messenger
//
//  Created by XP India on 04/08/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        loadCurrentUserData()
        print("DEBUG :- user session id is \(String(describing: userSession?.uid))")
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUserData()
        } catch {
            print("DEBUG :- failed to login with user \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUser(email: email, fullname: fullname, id: result.user.uid)
            loadCurrentUserData()
        }
        catch {
            print("DEBUG :- failed to create user \(error.localizedDescription)")
        }
    }
    
    func singout() {
        do {
            try Auth.auth().signOut() // sing out on bakend
            self.userSession = nil // update routing logic
            UserService.shared.currentUser = nil
        } catch {
            print("DEBUG :- failed to singout  \(error.localizedDescription)")
        }
    }
    
    func uploadUser(email: String, fullname: String, id: String) async throws {
        let user = User(fullName: fullname, email: email, profileImageURL: nil)
        guard let encodeUser = try? Firestore.Encoder().encode(user) else { return}
        try await Firestore.firestore().collection("users").document(id).setData(encodeUser)
    }
    
    func loadCurrentUserData() {
        Task { try await UserService.shared.fetchCurrentUser() }
    }
}
