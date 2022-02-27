//
//  FlowRowViewModelTests.swift
//  iOSTests
//
//  Created by Mariusz Sut on 27/02/2022.
//

import XCTest
import Core
@testable import iOS

final class FlowRowViewModelTests: XCTestCase {
    private typealias Literals = Assets.Strings.Core.Common
    private var country = PSEDirection.sweden
    private var currentValue = 100.0
    private var plannedValue = -200.0
    private lazy var sut = FlowRowViewModel(country: country,
                                            currentValue: currentValue,
                                            plannedValue: plannedValue)

    func testCurrentViewModel() {
        XCTAssertEqual(sut.country, .sweden)
        XCTAssertEqual(sut.currentViewModel.name, Literals.current)
        XCTAssertEqual(sut.currentViewModel.value, "100")
        XCTAssertEqual(sut.currentViewModel.state, .import)
    }

    func testPlannedViewModel() {
        XCTAssertEqual(sut.country, .sweden)
        XCTAssertEqual(sut.plannedViewModel.name, Literals.planned)
        XCTAssertEqual(sut.plannedViewModel.value, "200")
        XCTAssertEqual(sut.plannedViewModel.state, .export)
    }
}
