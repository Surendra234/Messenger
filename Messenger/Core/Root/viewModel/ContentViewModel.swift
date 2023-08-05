//
//  ContentViewModel.swift
//  Messenger
//
//  Created by XP India on 04/08/23.
//

import Firebase
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            guard let self = self else { return} 
            self.userSession = userSession
        }.store(in: &cancellables)
    }
}
