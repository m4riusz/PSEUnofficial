//
//  FlowDateRowViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 19/03/2022.
//

import Foundation

struct FlowDateRowViewModel {
    let date: Date
    let freshData: Bool

    var formattedDate: String {
        date.formatted(date: .numeric, time: .standard)
    }
}
