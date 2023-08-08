//
//  InboxService.swift
//  Messenger
//
//  Created by XP India on 07/08/23.
//

import Firebase

class InboxService: ObservableObject {
    
    @Published var documentChanges = [DocumentChange]()
    
    func obserRecentMessages() {
        guard let uid = Auth.auth().currentUser?.uid else { return}
        
        let querry = FirestoreConstants
            .MessageCollection
            .document(uid)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
        
        querry.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({
                $0.type == .added || $0.type == .modified
            }) else { return}
            
            self.documentChanges = changes
        }
    }
}
