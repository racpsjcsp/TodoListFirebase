//
//  ToDoFirebaseApp.swift
//  ToDoFirebase
//
//  Created by Rafael Plinio on 20/06/23.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoFirebaseApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
