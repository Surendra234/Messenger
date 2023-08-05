//
//  ChatViewModel.swift
//  Messenger
//
//  Created by XP India on 05/08/23.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var messageText = ""
    @Published var messages = [Message]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        observeMessages()
    }
    
    func observeMessages() {
        MessageService.observeMessage(chatPartner: user) { message in
            self.messages.append(contentsOf: message)
        }
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText, toUser: user)
    }
}
