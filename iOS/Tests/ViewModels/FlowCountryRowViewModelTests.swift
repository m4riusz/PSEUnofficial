//
//  FlowCountryRowViewModelTests.swift
//  iOSTests
//
//  Created by Mariusz Sut on 27/02/2022.
//

import XCTest
import Core
@testable import iOS

final class FlowCountryRowViewModelTests: XCTestCase {
    private typealias Literals = Assets.Strings.Core.Common
    private var country = PSEDirection.sweden
    private var currentValue = 100.0
    private var plannedValue = -200.0
    private var formatter = DoubleFormatter(minimumFractionDigits: 0, maximumFractionDigits: 0)
    private lazy var sut = FlowCountryRowViewModel(country: country,
                                                   currentValue: currentValue,
                                                   plannedValue: plannedValue,
                                                   doubleFormatter: formatter)

    func testCurrentViewModel() {
        XCTAssertEqual(sut.country, .sweden)
        XCTAssertEqual(sut.currentViewModel.literal, Literals.imported)
        XCTAssertEqual(sut.currentViewModel.formatedValue, "100")
        XCTAssertEqual(sut.currentViewModel.flowType, .import)
    }

    func testPlannedViewModel() {
        XCTAssertEqual(sut.country, .sweden)
        XCTAssertEqual(sut.plannedViewModel.literal, Literals.exported)
        XCTAssertEqual(sut.plannedViewModel.formatedValue, "200")
        XCTAssertEqual(sut.plannedViewModel.flowType, .export)
    }
}
