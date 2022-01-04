//
//  Cryptal_Bank_Widget.swift
//  Cryptal-Bank-Widget
//
//  Created by IMAC on 02.01.22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct Cryptal_Bank_WidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack{
            
            
            GeometryReader{ geo in
                
                Image("AppIcon-1").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width,
                           height: geo.size.height, alignment: .center)
                
            }
            
            
            Text(entry.date, style: .time)
                .font(Font.system(size: 24, weight: .semibold, design: .default))
                .foregroundColor(Color.white)
            
        }
        
    }
    
}


@main
struct Cryptal_Bank_Widget: Widget {
    let kind: String = "Cryptal_Bank_Widget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Cryptal_Bank_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Cryptal_Bank_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Cryptal_Bank_WidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
