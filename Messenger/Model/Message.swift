//
//  Message.swift
//  Messenger
//
//  Created by XP India on 05/08/23.
//

import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Codable, Hashable {
    @DocumentID var messageId: String?
    
    let fromId: String
    let toId: String
    let message: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String {
        return messageId ?? NSUUID().uuidString
    }
    
    var chatPartnerId: String {
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    
    var isFromCurrentUser: Bool {
        return fromId == Auth.auth().currentUser?.uid
    }
    
    var timestampString: String {
        return timestamp.dateValue().timestampString()
    }
}
