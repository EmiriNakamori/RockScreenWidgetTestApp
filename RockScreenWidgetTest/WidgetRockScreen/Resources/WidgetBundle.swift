//
//  WidgetBundle.swift
//  RockScreenWidgetTest
//
//  Created by nakamori on 2022/07/29.
//

import SwiftUI
import WidgetKit

@main
struct WidgetBundle: SwiftUI.WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        CircularMaster()
    }
}
