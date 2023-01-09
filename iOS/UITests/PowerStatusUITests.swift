//
//  PowerStatusUITests.swift
//  iOS
//
//  Created by Mariusz Sut on 09/04/2022.
//

import TestKit
import XCTest

final class PowerStatusUITests: BaseUITest {

    override var serviceResponses: [Selector: String] {
        [#selector(testSuccessScreen): "transmissionMapService:transmissionMapService_success"]
    }

    private lazy var page = MainPage(application: application)
        .openStatusPage()

    func testSuccessScreen() {
        page
    }
}
