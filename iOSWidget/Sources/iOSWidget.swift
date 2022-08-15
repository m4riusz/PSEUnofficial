//
//  iOSWidget.swift
//  iOSWidget
//
//  Created by Mariusz Sut on 15/08/2022.
//

import WidgetKit
import SwiftUI

@main
struct iOSWidget: Widget {
    let kind: String = "iOSWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            iOSWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}
