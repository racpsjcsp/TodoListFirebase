//
//  ToDoListItemViewViewModel.swift
//  ToDoFirebase
//
//  Created by Rafael Plinio on 21/06/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(state: !item.isDone)
        
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        let database = Firestore.firestore()
        database.collection("users")
            .document(userID)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
