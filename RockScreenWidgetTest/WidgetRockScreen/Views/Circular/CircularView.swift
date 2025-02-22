//
//  CircularView.swift
//  RockScreenWidgetTest
//
//  Created by nakamori on 2022/07/29.
//

import WidgetKit
import SwiftUI

struct CircularView: View {
    @Environment(\.widgetRenderingMode) var renderingMode
    @Environment(\.widgetFamily) var family
    var body: some View {
//                switch renderingMode {
//                case .fullColor:
//                    Text("Full color")
//                case .accented:
//                    VStack(alignment: .leading) {
//                        Text("Headline")
//                            .font(.headline)
//                            .widgetAccentable()
//                        Text("Body 1")
//                        Text("Body 2")
//                    }.frame(maxWidth: .infinity, alignment: .leading)
//                case .vibrant:
//                    Text("vibrant")
//                default:
//                    Text("default")
//                }

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
                VStack {
                    Image("warning_icon_katanuki")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .leading)
                }
            }
        case .accessoryRectangular:
            ZStack {
//                AccessoryWidgetBackground()
                HStack(alignment: .center, spacing: 0) {
                    VStack(alignment: .leading) {
                        Text("千代田区").font(.headline)
                            .widgetAccentable()
                        Text("上昇注意")
                        Text("1014hPa")

                    }.frame(maxWidth: .infinity, alignment: .leading)
                    Image("warning_icon_katanuki")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .leading)
                }
            }

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

struct WidgetRockScreen_Previews: PreviewProvider {
    static var previews: some View {
        CircularView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
