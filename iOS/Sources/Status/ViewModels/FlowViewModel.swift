//
//  FlowViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import Core
import SwiftUI

struct FlowViewModel {
    let name: String
    let value: String
    let state: FlowState

    var tintColor: Color {
        state.tintColor
    }

    var literal: String {
        state.literal
    }

    init(name: String, value: Double) {
        self.name = name
        self.value = DoubleFormatter().string(value: abs(value))
        state = FlowState(value: value)
    }
}
