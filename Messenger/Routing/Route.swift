//
//  Route.swift
//  Messenger
//
//  Created by XP India on 08/08/23.
//

import Foundation

enum Route: Hashable {
    case profileView(User)
    case chatView(User)
}
