//
//  ToDoeyApp.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 02. 16..
//

import SwiftUI

@main
struct ToDoeyApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(IconSettings())
        }
    }
}
