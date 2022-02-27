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
    private typealias Colors = Assets.Colors.iOS
    let name: String
    let value: String
    let state: FlowState

    var tintColor: Color {
        switch state {
        case .export: return Colors.exportTintColor
        case .import: return Colors.importTintColor
        case .none: return .primary
        }
    }

    var literal: String {
        switch state {
        case .export: return Literals.exported
        case .import: return Literals.imported
        case .none: return ""
        }
    }
}
