//
//  StatusEntry.swift
//  iOSWidget
//
//  Created by Mariusz Sut on 15/08/2022.
//

import Core
import WidgetKit

struct StatusEntry: TimelineEntry {
    var date: Date { data.date }
    let data: PSEStatus
}
