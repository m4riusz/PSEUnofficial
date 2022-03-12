//
//  DoubleFormatter.swift
//  Core
//
//  Created by Mariusz Sut on 26/02/2022.
//

import Foundation

public protocol DoubleValueFormatter {
    func format(value: Double) -> String
}

struct DoubleFormatter: DoubleValueFormatter {
    private struct Constants {
        static let comma = ","
        static let space = " "
        static let groupingSize = 3
    }
    private let minimumFractionDigits: Int
    private let maximumFractionDigits: Int

    init(minimumFractionDigits: Int, maximumFractionDigits: Int) {
        self.minimumFractionDigits = minimumFractionDigits
        self.maximumFractionDigits = maximumFractionDigits
    }

    func format(value: Double) -> String {
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
