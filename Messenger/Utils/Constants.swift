//
//  Constants.swift
//  Messenger
//
//  Created by XP India on 07/08/23.
//

import Firebase

struct FirestoreConstants {
    static let UserCollection = Firestore.firestore().collection("users")
    static let MessageCollection = Firestore.firestore().collection("messages")
}
