//
//  InboxViewModel.swift
//  Messenger
//
//  Created by XP India on 05/08/23.
//

import Combine

class InboxViewModel: ObservableObject {
    
    @Published var currentUser: User?
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setupSubscriber()
    }
    
    private func setupSubscriber() {
        UserService.shared.$currentUser.sink { [weak self] user in
            guard let self = self else { return}
            self.currentUser = user
        }.store(in: &cancellable)
    }
}
