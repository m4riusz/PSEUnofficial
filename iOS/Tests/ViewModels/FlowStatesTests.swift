//
//  FlowStatesTests.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import XCTest
import Core
@testable import iOS

final class FlowStatesTests: XCTestCase {
    typealias Colors = Assets.Colors.iOS
    typealias Literals = Assets.Strings.Core.Common
    private var value = 123.0
    private lazy var sut = FlowState(value: value)

    func testInitImport() {
        XCTAssertEqual(sut, .import)
    }

    func testInitExport() {
        value = -123
        XCTAssertEqual(sut, .export)
    }

    func testNone() {
        value = 0
        XCTAssertEqual(sut, .none)
    }

    func testExportTintColor() {
        XCTAssertEqual(FlowState.export.tintColor, Colors.exportTintColor)
    }

    func testImportTintColor() {
        XCTAssertEqual(FlowState.import.tintColor, Colors.importTintColor)
    }

    func testNoneTintColor() {
        XCTAssertEqual(FlowState.none.tintColor, Colors.noneTintColor)
    }

    func testExportLiteral() {
        XCTAssertEqual(FlowState.export.literal, Literals.exported)
    }

    func testImportLiteral() {
        XCTAssertEqual(FlowState.import.literal, Literals.imported)
    }

    func testNoneLiteral() {
        XCTAssertTrue(FlowState.none.literal.isEmpty)
    }
}
