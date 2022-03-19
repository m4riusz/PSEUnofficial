//
//  FlowViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import Core

struct FlowViewModel {
    enum Orientation {
        case horizontal
        case vertical
    }
    let flowType: FlowType
    let rawValue: Double
    let formatedValue: String
    let literal: String
    let orientation: Orientation

    init(value: Double, orientation: Orientation, formatter: DoubleValueFormatter) {
        flowType = FlowType(value: value)
        rawValue = value
        formatedValue = formatter.format(value: abs(value))
        literal = flowType.literal
        self.orientation = orientation
    }
}
