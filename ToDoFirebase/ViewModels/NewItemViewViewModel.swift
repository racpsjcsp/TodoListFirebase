//
//  NewItemViewViewModel.swift
//  ToDoFirebase
//
//  Created by Rafael Plinio on 21/06/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard isValidToSave else {
            return
        }
        
        // Get current userID
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newID = UUID().uuidString
        let newItem = ToDoListItem(id: newID,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        // Save model to database
        let database = Firestore.firestore()
        database.collection("users")
            .document(userID)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
        
    }
    
    var isValidToSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else { // 86400 = seconds in a day
            return false
        }
        
        return true
    }
}
