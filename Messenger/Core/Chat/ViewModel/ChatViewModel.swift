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
    
    let service: ChatService

    init(user: User) {
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    
    func observeMessages() {
        service.observeMessage() { message in
            self.messages.append(contentsOf: message)
        }
    }
    
    func sendMessage() {
        service.sendMessage(messageText)
    }
}
