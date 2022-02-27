//
//  DoubleFormatterTests.swift
//  CoreTests
//
//  Created by Mariusz Sut on 26/02/2022.
//

import XCTest

@testable import Core

final class FormatterTests: XCTestCase {
    private var number = 1.123456789
    private var minimumFractionDigits = 0
    private var maximumFractionDigits = 0
    private lazy var formattedValue = DoubleFormatter().string(value: number,
                                                               minimumFractionDigits: minimumFractionDigits,
                                                               maximumFractionDigits: maximumFractionDigits)

    func testShortNumberNoFractionDigits() {
        XCTAssertEqual(formattedValue, "1")
    }

    func testShortNumberSomeFractionDigits() {
        maximumFractionDigits = 3
        XCTAssertEqual(formattedValue, "1,123")
    }

    func testShortNumberSomeOptionalFractionDigits() {
        number = 1.000000123
        maximumFractionDigits = 3
        XCTAssertEqual(formattedValue, "1")
    }

    func testShortNumberLongFractionDigits() {
        number = 1.1234
        maximumFractionDigits = 9
        XCTAssertEqual(formattedValue, "1,1234")
    }

    func testShortNumberSomeRequiredFractionDigits() {
        number = 1.000000123
        minimumFractionDigits = 3
        maximumFractionDigits = 3
        XCTAssertEqual(formattedValue, "1,000")
    }

    func testLongNumberGrouping() {
        number = 123456789
        XCTAssertEqual(formattedValue, "123 456 789")
    }
}
