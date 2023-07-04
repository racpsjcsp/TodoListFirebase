//
//  User.swift
//  ToDoFirebase
//
//  Created by Rafael Plinio on 21/06/23.
//

import Foundation

struct User: Codable {
    let userID: String
    let name: String
    let email: String
    let joined: TimeInterval
}
