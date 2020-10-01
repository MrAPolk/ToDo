//
//  ToDoItemView.swift
//  ToDo
//
//  Created by Andrew Polkinghorn on 30/09/2020.
//

import SwiftUI

struct ToDoItemView: View {
    
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "circle")
            Text(text)
            Spacer()
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(text: "Hello World!")
    }
}
