//
//  StatusEntry.swift
//  iOSWidget
//
//  Created by Mariusz Sut on 15/08/2022.
//

import Core
import WidgetKit

struct StatusEntry: TimelineEntry {
    let result: Result<PSEStatus, Error>

    var date: Date {
        switch result {
        case .success(let status): return status.date
        case .failure: return .now
        }
    }
}
