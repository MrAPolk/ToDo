//
//  ToDoListView.swift
//  ToDo
//
//  Created by Andrew Polkinghorn on 01/10/2020.
//

import SwiftUI

struct ToDoListView: View {
    var items: [ToDoItem]
    var body: some View {
        List {
            ForEach(items, id: \.timestamp) { item in
                ToDoItemView(text: item.text)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        let items = [
            ToDoItem(text: "Test 1", timestamp: Date()),
            ToDoItem(text: "Test 2", timestamp: Date()),
            ToDoItem(text: "Test 3", timestamp: Date()),
            ToDoItem(text: "Test 4", timestamp: Date()),
            ToDoItem(text: "Test 5", timestamp: Date())
        ]
        ToDoListView(items: items)
    }
}

