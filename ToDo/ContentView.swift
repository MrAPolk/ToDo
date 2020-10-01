//
//  ContentView.swift
//  ToDo
//
//  Created by Andrew Polkinghorn on 30/09/2020.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let items = [
        ToDoItem(text: "To Do #1", timestamp: Date()),
        ToDoItem(text: "To Do #2", timestamp: Date()),
        ToDoItem(text: "To Do #3", timestamp: Date()),
        ToDoItem(text: "To Do #4", timestamp: Date()),
        ToDoItem(text: "To Do #5", timestamp: Date())
    ]
    
    var body: some View {
        VStack(alignment: .leading){
            ToDoListView(items: items)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
