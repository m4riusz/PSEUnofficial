//
//  BaseUITest.swift
//  iOS
//
//  Created by Mariusz Sut on 02/04/2022.
//

import XCTest

class BaseUITest: XCTestCase {

    override func setUp() {
        let app = XCUIApplication()
        app.launch()
        sleep(2)
        app.activate()
    }
}
