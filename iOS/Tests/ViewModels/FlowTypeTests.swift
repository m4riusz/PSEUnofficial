//
//  FlowTypeTests.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import XCTest
import Core
@testable import iOS

final class FlowTypeTests: XCTestCase {
    typealias Colors = Assets.Colors.iOS
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
