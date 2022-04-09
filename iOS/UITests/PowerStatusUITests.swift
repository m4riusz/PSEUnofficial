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
        [#selector(testSuccessScreen): "PSERequestStatus:somevalue,PSERequestStatus:otherValue,NewService:val",
         #selector(testErrorScreen): "blahblah:asas"]
    }

    private lazy var page = MainPage(application: application)
        .openStatusPage()

    func testSuccessScreen() {

    }

    func testErrorScreen() {

    }
}
