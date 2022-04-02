//
//  ApperanceElement.swift
//  iOS
//
//  Created by Mariusz Sut on 02/04/2022.
//

import XCTest

protocol ApperanceElement {
    var apperanceElement: XCUIElement { get }

    func waitForApperance() -> Self
    func waitForApperance(timeout: TimeInterval) -> Self
    func waitForApperance(timeout: TimeInterval, message: String) -> Self
}

extension ApperanceElement {

    @discardableResult
    func waitForApperance() -> Self {
        waitForApperance()
    }

    @discardableResult
    func waitForApperance(timeout: TimeInterval) -> Self {
        waitForApperance(timeout: timeout)
    }

    @discardableResult
    func waitForApperance(timeout: TimeInterval = 1, message: String = "Element not appeared!") -> Self {
        print("WAIT 5 Seconds")
        guard apperanceElement.waitForExistence(timeout: 5) else {
            print("Not Found")
            XCTFail(message)
            return self
        }
        print("Found")
        return self
    }
}
