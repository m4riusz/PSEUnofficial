//
//  FlowState.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import Foundation

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
