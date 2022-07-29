//
//  CircularMaster.swift
//  RockScreenWidgetTest
//
//  Created by nakamori on 2022/07/29.
//

import SwiftUI
import WidgetKit

struct CircularMaster: Widget {
    let kind: String = "CircularMaster"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind,  provider: WidgetRockScreenProvider()) { entry in
            CircularView()
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.accessoryCircular, .accessoryRectangular, .accessoryInline])
    }
}
