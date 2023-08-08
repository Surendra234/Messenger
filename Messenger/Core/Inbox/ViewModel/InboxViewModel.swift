//
//  InboxViewModel.swift
//  Messenger
//
//  Created by XP India on 05/08/23.
//

import Combine
import Firebase

class InboxViewModel: ObservableObject {
    
    @Published var currentUser: User?
    @Published var recentMessage = [Message]()
    
    private var cancellable = Set<AnyCancellable>()
    private let service = InboxService()
    
    init() {
        setupSubscriber()
        service.obserRecentMessages()
    }
    
    private func setupSubscriber() {
        UserService.shared.$currentUser.sink { [weak self] user in
            guard let self = self else { return}
            self.currentUser = user
        }.store(in: &cancellable)
        
        service.$documentChanges.sink { [weak self] changes in
            guard let self = self else { return}
            self.loadInitalMessages(fromChanges: changes)
        }.store(in: &cancellable)
    }
    
    private func loadInitalMessages(fromChanges changes: [DocumentChange]) {
        var messages = changes.compactMap({ try? $0.document.data(as: Message.self) })
        
        for i in 0 ..< messages.count {
            let message = messages[i]
            
            UserService.fetchUser(withUid: message.chatPartnerId) { user in
                messages[i].user = user
                self.recentMessage.append(messages[i])
            }
        }
    }
}
