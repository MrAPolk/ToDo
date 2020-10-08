//
//  ContentView.swift
//  ToDo
//
//  Created by Andrew Polkinghorn on 30/09/2020.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var items: [ToDoItem] = [
        ToDoItem(text: "To Do #1", timestamp: Date()),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ToDoListView(items: items)
                NavigationLink(destination: ToDoInputView(addToDo: addToDo)) {
                    CustomTextView(text: "Add To Do")
                }
            }
            .navigationBarTitle("To Dos", displayMode: .inline)
        }
    }
    
    func addToDo(_ text: String) {
        items.append(ToDoItem(text: text, timestamp: Date()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
