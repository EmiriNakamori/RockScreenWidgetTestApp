//
//  WidgetRockScreen.swift
//  WidgetRockScreen
//
//  Created by nakamori on 2022/07/28.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct WidgetRockScreenEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetRenderingMode) var renderingMode
    @Environment(\.widgetFamily) var family
    var body: some View {
        //        switch renderingMode {
        //        case .fullColor:
        //            Text("Full color")
        //        case .accented:
        //            VStack(alignment: .leading) {
        //                Text("Headline")
        //                    .font(.headline)
        //                    .widgetAccentable()
        //                Text("Body 1")
        //                Text("Body 2")
        //            }.frame(maxWidth: .infinity, alignment: .leading)
        //        case .vibrant:
        //            Text("vibrant")
        //        default:
        //            Text("default")
        //        }

        switch family {
        case .systemSmall:
            Text("スモールver")
        case .systemMedium:
            Text("ミディアムver")
        case .systemLarge:
            Text("ラージver")
        case .systemExtraLarge:
            Text("エクストララージver")
        case .accessoryCircular:
            ZStack {
                AccessoryWidgetBackground()
                VStack {
                    Image("apple")
                        .resizable()
                        .frame(width: 30.0, height: 30.0, alignment: .leading)
                }
            }
        case .accessoryRectangular:
            VStack(alignment: .leading) {
                Text("10:00-12:00PM")
                //                Text("WWDC22 Keynote")
                //                    .font(.headline)
                //                    .widgetAccentable()
                Image("risu")
                    .resizable()
                    .frame(width: 30.0, height: 30.0, alignment: .leading)
                Text("1 Apple Park Way.CCCCC")
            }.frame(maxWidth: .infinity, alignment: .leading)

        case .accessoryInline:
            HStack {
                Image("apple")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30.0, height: 30.0, alignment: .leading)
                Text("apple")
            }
        @unknown default:
            Text("default")
        }
    }
}

@main
struct WidgetRockScreen: Widget {
    let kind: String = "WidgetRockScreen"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetRockScreenEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.accessoryCircular, .accessoryRectangular, .accessoryInline])
    }
}

struct WidgetRockScreen_Previews: PreviewProvider {
    static var previews: some View {
        WidgetRockScreenEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
