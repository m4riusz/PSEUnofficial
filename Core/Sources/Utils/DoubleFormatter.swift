//
//  DoubleFormatter.swift
//  Core
//
//  Created by Mariusz Sut on 26/02/2022.
//

import Foundation

public struct DoubleFormatter {
    private struct Constants {
        static let comma = ","
        static let space = " "
        static let groupingSize = 3
    }

    public init() { /*NOP*/ }

    public func string(value: Double, minimumFractionDigits: Int = 0, maximumFractionDigits: Int = 0) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = minimumFractionDigits
        numberFormatter.maximumFractionDigits = maximumFractionDigits
        numberFormatter.decimalSeparator = Constants.comma
        numberFormatter.groupingSeparator = Constants.space
        numberFormatter.paddingCharacter = Constants.space
        numberFormatter.groupingSize = Constants.groupingSize
        return numberFormatter.string(from: NSDecimalNumber(value: value))!
    }
}
