//
//  FlowType.swift
//  iOS
//
//  Created by Mariusz Sut on 12/03/2022.
//

import Core
import SwiftUI

public enum FlowType {
    case export
    case `import`
    case none

    public init(value: Double) {
        if value > 0 {
            self = .import
        } else if value < 0 {
            self = .export
        } else {
            self = .none
        }
    }

    public var tintColor: Color {
        typealias Colors = Assets.Colors.Core
        switch self {
        case .export: return Colors.exportTintColor
        case .import: return Colors.importTintColor
        case .none: return Colors.noneTintColor
        }
    }

    public var literal: String {
        typealias Literals = Assets.Strings.Core.Common
        switch self {
        case .export: return Literals.exported
        case .import: return Literals.imported
        case .none: return ""
        }
    }
}
