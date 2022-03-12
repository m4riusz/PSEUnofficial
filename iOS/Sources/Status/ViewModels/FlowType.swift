//
//  FlowType.swift
//  iOS
//
//  Created by Mariusz Sut on 12/03/2022.
//

import Core

enum FlowType {
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

    var literal: String {
        typealias Literals = Assets.Strings.Core.Common
        switch self {
        case .export: return Literals.exported
        case .import: return Literals.imported
        case .none: return ""
        }
    }
}
