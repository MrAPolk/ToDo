//
//  ToDoWidget.swift
//  ToDoWidget
//
//  Created by Andrew Polkinghorn on 30/09/2020.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    private let items = [
        ToDoItem(text: "To Do #1", timestamp: Date()),
        ToDoItem(text: "To Do #2", timestamp: Date()),
        ToDoItem(text: "To Do #3", timestamp: Date()),
        ToDoItem(text: "To Do #4", timestamp: Date()),
        ToDoItem(text: "To Do #5", timestamp: Date())
    ]
    
    func placeholder(in context: Context) -> ToDoEntry {
        ToDoEntry(date: Date(), items: [])
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (ToDoEntry) -> ()) {
        let entry = ToDoEntry(date: Date(), items: items)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {

        let timeline = Timeline(entries: [ToDoEntry(date: Date(), items: items)], policy: .atEnd)
        completion(timeline)
    }
}

struct ToDoEntry: TimelineEntry {
    var date: Date
    var items: [ToDoItem]
}

struct ToDoWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ToDoWidgetView(items: entry.items)
    }
}

@main
struct ToDoWidget: Widget {
    let kind: String = "ToDoWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            ToDoWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("ToDo Widget")
        .description("Displays ToDo list.")
    }
}

struct ToDoWidget_Previews: PreviewProvider {
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
