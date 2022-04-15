//
//  BaseUITest.swift
//  iOS
//
//  Created by Mariusz Sut on 02/04/2022.
//

import XCTest

open class BaseUITest: XCTestCase {
    private struct Constants {
        static let isRuningUITest = "isRuningUITest"
        static let aditionalServiceResponses = "aditionalServiceResponses"
    }
    open var serviceResponses: [Selector: String] {
        [:]
    }
    open var application = XCUIApplication()

    open override func setUp() {
        super.setUp()
        application = XCUIApplication()
        application.launchEnvironment[Constants.isRuningUITest] = String(true)
        if let currentTest = invocation?.selector, let serviceResponses = serviceResponses[currentTest] {
            application.launchEnvironment[Constants.aditionalServiceResponses] = serviceResponses
        }
        application.launch()
    }
}
