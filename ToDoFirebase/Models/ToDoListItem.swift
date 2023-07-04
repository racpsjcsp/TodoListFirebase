//
//  ToDoListItem.swift
//  ToDoFirebase
//
//  Created by Rafael Plinio on 21/06/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(state: Bool) {
        isDone = state
    }
}
