//
//  FlowViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//
import SwiftUI

public struct FlowViewModel {
    public enum Orientation {
        case horizontal
        case vertical
    }
    public let flowType: FlowType
    public let rawValue: Double
    public let formatedValue: String
    public let literal: String
    public let orientation: Orientation

    public init(value: Double, orientation: Orientation, formatter: DoubleValueFormatter) {
        flowType = FlowType(value: value)
        rawValue = value
        formatedValue = formatter.format(value: abs(value))
        literal = flowType.literal
        self.orientation = orientation
    }
}
