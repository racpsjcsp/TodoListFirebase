//
//  ToDoListViewViewModel.swift
//  ToDoFirebase
//
//  Created by Rafael Plinio on 21/06/23.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel: ObservableObject {
    @Published var showingNewItemView: Bool = false
    private let userID: String

    init(userID: String) {
        self.userID = userID
    }
    
    func delete(itemID: String) {
        let database = Firestore.firestore()
        database.collection("users")
            .document(userID)
            .collection("todos")
            .document(itemID)
            .delete()
    }
}
