//
//  ChatViewModel.swift
//  Messenger
//
//  Created by XP India on 05/08/23.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var messageText = ""
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText, toUser: user)
    }
}
