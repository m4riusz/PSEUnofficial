//
//  FlowState.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import Core
import SwiftUI

enum FlowState {
    case export
    case `import`
    case none

    init(value: Double) {
        if value > 0 {
            self = .import
        } else if value < 0 {
            self = .export
        } else {
            self = .none
        }
    }
}

extension FlowState {
    var tintColor: Color {
        typealias Colors = Assets.Colors.iOS
        switch self {
        case .export: return Colors.exportTintColor
        case .import: return Colors.importTintColor
        case .none: return Colors.noneTintColor
        }
    }

    var literal: String {
        typealias Literals = Assets.Strings.Core.Common
        switch self {
        case .export: return Literals.exported
        case .import: return Literals.imported
        case .none: return ""
        }
    }
}
