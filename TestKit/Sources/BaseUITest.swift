//
//  BaseUITest.swift
//  iOS
//
//  Created by Mariusz Sut on 02/04/2022.
//

import XCTest

open class BaseUITest: XCTestCase {
    open var application = XCUIApplication()

    open override func setUp() {
        super.setUp()
        application = XCUIApplication()
        application.launch()
    }
}
