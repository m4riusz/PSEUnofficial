//
//  FlowViewModelTests.swift
//  iOSTests
//
//  Created by Mariusz Sut on 27/02/2022.
//

import XCTest
import Core
@testable import iOS

final class FlowViewModelTests: XCTestCase {
    private typealias Literals = Assets.Strings.Core.Common
    private typealias Colors = Assets.Colors.iOS
    private var orientation = FlowViewModel.Orientation.vertical
    private var formatter = DoubleFormatter(minimumFractionDigits: 0, maximumFractionDigits: 0)
    private var flowValue = 100.0
    private lazy var sut = FlowViewModel(value: flowValue, orientation: orientation, formatter: formatter)

    func testFormattedValueImport() {
        XCTAssertEqual(sut.formatedValue, "100")
    }

    func testFormattedValueExport() {
        flowValue = -100
        XCTAssertEqual(sut.formatedValue, "100")
    }

    func testFormattedValueNone() {
        flowValue = 0
        XCTAssertEqual(sut.formatedValue, "0")
    }

    func testFlowTypeImport() {
        XCTAssertEqual(sut.flowType, .import)
    }

    func testFlowTypeExport() {
        flowValue = -100
        XCTAssertEqual(sut.flowType, .export)
    }

    func testFlowTypeNone() {
        flowValue = 0
        XCTAssertEqual(sut.flowType, .none)
    }

    func testLiteralImport() {
        XCTAssertEqual(sut.literal, Literals.imported)
    }

    func testLiteralExport() {
        flowValue = -100
        XCTAssertEqual(sut.literal, Literals.exported)
    }

    func testLiteralNone() {
        flowValue = 0
        XCTAssertTrue(sut.literal.isEmpty)
    }
}
