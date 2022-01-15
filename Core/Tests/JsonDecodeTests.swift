//
//  JsonDecodeTests.swift
//  CoreTests
//
//  Created by Mariusz Sut on 15/01/2022.
//

import XCTest
@testable import Core

final class JsonDecodeTests: XCTestCase {
    private struct Constants {
        static let testFile = "transmission-map-service-sample.json"
    }
    private lazy var sut = JSONDecoder()

    func testDecode() throws {
        let testData = try XCTUnwrap(Resource(bundleForClass: Self.self, file: Constants.testFile).data)
        XCTAssertNoThrow(try sut.decode(PSEStatus.self, from: testData))
    }
}
