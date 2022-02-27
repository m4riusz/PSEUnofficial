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
    private var nameLabel = "Name"
    private var flowValue = 100.0
    private lazy var sut = FlowViewModel(name: nameLabel, value: flowValue)

    func testNameAndValue() {
        XCTAssertEqual(sut.name, nameLabel)
        XCTAssertEqual(sut.value, "100")
        XCTAssertEqual(sut.state, .import)
    }

    func testTintColorImport() {
        XCTAssertEqual(sut.tintColor, Colors.importTintColor)
    }

    func testTintColorExport() {
        flowValue = -100
        XCTAssertEqual(sut.tintColor, Colors.exportTintColor)
    }

    func testTintColorNone() {
        flowValue = 0
        XCTAssertEqual(sut.tintColor, Colors.noneTintColor)
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
