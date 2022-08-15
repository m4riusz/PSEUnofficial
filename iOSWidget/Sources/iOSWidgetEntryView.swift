//
//  iOSWidgetEntryView.swift
//  Core
//
//  Created by Mariusz Sut on 15/08/2022.
//

import Foundation
import SwiftUI
import Core

struct iOSWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}
