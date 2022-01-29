//
//  PSEJsonDecoderTests.swift
//  CoreTests
//
//  Created by Mariusz Sut on 15/01/2022.
//

import XCTest
@testable import Core

final class PSEJsonDecoderTests: XCTestCase {
    private struct Constants {
        static let testFile = "transmission-map-service-sample.json"
    }
    private lazy var sut = PSEJsonDecoder()

    func testDecodeDate() throws {
        let testData = try XCTUnwrap(Resource(bundleForClass: Self.self, file: Constants.testFile).data)
        let result = try XCTUnwrap(sut.decode(PSEStatusDto.self, from: testData))
        XCTAssertEqual(result.date, Date(timeIntervalSince1970: 1642255965451 / 1000))
    }
}
