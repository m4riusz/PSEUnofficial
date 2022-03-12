//
//  FlowCrossBorderExchangeViewModelTests.swift
//  iOS
//
//  Created by Mariusz Sut on 12/03/2022.
//

import XCTest
import Core
@testable import iOS

final class FlowCrossBorderExchangeViewModelTests: XCTestCase {
    private typealias Literals = Assets.Strings.Core.Common
    private var title = "title"
    private var currentValue = 100.0
    private var plannedValue = -200.0
    private var formatter = DoubleFormatter(minimumFractionDigits: 0, maximumFractionDigits: 0)

    private lazy var sut = FlowCrossBorderExchangeViewModel(title: title,
                                                            current: currentValue,
                                                            planned: plannedValue,
                                                            formatter: formatter)

    func testCurrent() {
        XCTAssertEqual(sut.currentLiteral, Literals.current)
        XCTAssertEqual(sut.current.formatedValue, "100")
        XCTAssertEqual(sut.current.flowType, .import)
        XCTAssertEqual(sut.current.orientation, .vertical)
    }

    func testPlanned() {
        XCTAssertEqual(sut.plannedLiteral, Literals.planned)
        XCTAssertEqual(sut.planned.formatedValue, "200")
        XCTAssertEqual(sut.planned.flowType, .export)
        XCTAssertEqual(sut.planned.orientation, .vertical)
    }
}
