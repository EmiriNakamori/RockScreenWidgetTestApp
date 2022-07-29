//
//  WidgetRockScreenProvider.swift
//  RockScreenWidgetTest
//
//  Created by nakamori on 2022/07/29.
//

import SwiftUI
import WidgetKit

struct WidgetRockScreenProvider: TimelineProvider {

    func placeholder(in context: Context) -> WidgetRockScreenEntryModel {
        WidgetRockScreenEntryModel(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (WidgetRockScreenEntryModel) -> Void) {
        let entry = WidgetRockScreenEntryModel(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetRockScreenEntryModel>) -> Void) {
        var entries: [WidgetRockScreenEntryModel] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = WidgetRockScreenEntryModel(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
