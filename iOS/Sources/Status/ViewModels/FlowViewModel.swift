//
//  FlowViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import Core
import SwiftUI

struct FlowViewModel {
    private typealias Literals = Assets.Strings.Core.Common

    let name: String
    let value: String
    let state: FlowState

    var tintColor: Color {
        state.tintColor
    }

    var literal: String {
        switch state {
        case .export: return Literals.exported
        case .import: return Literals.imported
        case .none: return ""
        }
    }

    init(name: String, value: Double) {
        self.name = name
        self.value = DoubleFormatter().string(value: abs(value))
        state = FlowState(value: value)
    }
}
