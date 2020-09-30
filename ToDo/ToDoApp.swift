//
//  ToDoApp.swift
//  ToDo
//
//  Created by Andrew Polkinghorn on 30/09/2020.
//

import SwiftUI

@main
struct ToDoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
