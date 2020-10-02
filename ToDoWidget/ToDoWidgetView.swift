//
//  ToDoWidgetView.swift
//  ToDo
//
//  Created by Andrew Polkinghorn on 01/10/2020.
//

import SwiftUI
import WidgetKit

struct ToDoWidgetView: View {
    
    @Environment(\.widgetFamily) var family
    
    var items: [ToDoItem]
    
    var body: some View {
        VStack {
            Text("To Dos").font(.headline).padding(.bottom, 2)
            VStack(spacing: 6) {
                switch(family) {
                case .systemSmall:
                    createToDoList(count: 2)
                case .systemMedium:
                    createToDoList(count: 4)
                case .systemLarge:
                    createToDoList(count: 8)
                @unknown default:
                    Text("Invalid Widget Family")
                }
            }
            Spacer()
        }.padding(8)
    }
    
    private func createToDoList(count: Int) -> some View {
        return Group {
            ForEach(0...count-1, id: \.self) { index in
                if(index < items.count){
                    ToDoItemView(text: items[index].text).font(.subheadline)
                }
            }
        }
    }
}

struct ToDoWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        let items = [
            ToDoItem(text: "Write a letter", timestamp: Date()),
            ToDoItem(text: "Pick up dry cleaning", timestamp: Date()),
        ]
        return ToDoWidgetView(items: items)
            .previewContext(WidgetPreviewContext(family: .systemSmall)
                                )
    }
}
