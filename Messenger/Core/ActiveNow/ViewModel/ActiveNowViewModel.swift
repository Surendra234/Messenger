//
//  ActiveNowViewModel.swift
//  Messenger
//
//  Created by XP India on 08/08/23.
//

import Firebase

class ActiveNowViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return}
        let users = try await UserService.fetchAllUser(limit: 10)
        self.users = users.filter({ $0.id != currentUid})
    }
}
