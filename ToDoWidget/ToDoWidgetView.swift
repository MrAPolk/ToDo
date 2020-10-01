//
//  ToDoWidgetView.swift
//  ToDo
//
//  Created by Andrew Polkinghorn on 01/10/2020.
//

import SwiftUI
import WidgetKit

struct ToDoWidgetView: View {
    
    var items: [ToDoItem]
    
    var body: some View {
        VStack {
            Text("To Dos").font(.headline).padding(.bottom, 2)
            VStack(spacing: 6) {
                ToDoItemView(text: items[0].text).font(.subheadline)
                ToDoItemView(text: items[1].text).font(.subheadline)
            }
            Spacer()
        }.padding(8)
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
