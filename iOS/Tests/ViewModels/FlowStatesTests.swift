//
//  FlowStatesTests.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import XCTest
@testable import iOS

final class FlowStatesTests: XCTestCase {
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
}
