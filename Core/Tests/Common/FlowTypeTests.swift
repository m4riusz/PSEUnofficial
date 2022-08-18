//
//  FlowTypeTests.swift
//  Core
//
//  Created by Mariusz Sut on 27/02/2022.
//

import XCTest
@testable import Core

final class FlowTypeTests: XCTestCase {
    typealias Colors = Assets.Colors.Core
    typealias Literals = Assets.Strings.Core.Common
    private var value = 123.0
    private lazy var sut = FlowType(value: value)

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
        XCTAssertEqual(FlowType.export.tintColor, Colors.exportTintColor)
    }

    func testImportTintColor() {
        XCTAssertEqual(FlowType.import.tintColor, Colors.importTintColor)
    }

    func testNoneTintColor() {
        XCTAssertEqual(FlowType.none.tintColor, Colors.noneTintColor)
    }

    func testExportLiteral() {
        XCTAssertEqual(FlowType.export.literal, Literals.exported)
    }

    func testImportLiteral() {
        XCTAssertEqual(FlowType.import.literal, Literals.imported)
    }

    func testNoneLiteral() {
        XCTAssertTrue(FlowType.none.literal.isEmpty)
    }
}
