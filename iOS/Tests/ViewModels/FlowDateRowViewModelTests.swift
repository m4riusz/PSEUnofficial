//
//  FlowDateRowViewModelTests.swift
//  iOS
//
//  Created by Mariusz Sut on 19/03/2022.
//

import XCTest
import Core
@testable import iOS

final class FlowDateRowViewModelTests: XCTestCase {
    private var date = Date(timeIntervalSince1970: 1647365378)
    private var freshData = true
    private lazy var sut = FlowDateRowViewModel(date: date, freshData: freshData)

    func testFormatting() {
        XCTAssertEqual(sut.formattedDate, "15.03.2022 o 18:29:38")
    }
}
