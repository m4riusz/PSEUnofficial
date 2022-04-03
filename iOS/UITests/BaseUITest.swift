//
//  BaseUITest.swift
//  iOS
//
//  Created by Mariusz Sut on 02/04/2022.
//

import XCTest

class BaseUITest: XCTestCase {
    var application = XCUIApplication()

    override func setUp() {
        application = XCUIApplication()
        application.launch()
    }
}
