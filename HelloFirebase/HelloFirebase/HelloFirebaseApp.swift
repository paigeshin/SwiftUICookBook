//
//  HelloFirebaseApp.swift
//  HelloFirebase
//
//  Created by Mohammad Azam on 10/20/20.
//

import SwiftUI
import Firebase

@main
struct HelloFirebaseApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
