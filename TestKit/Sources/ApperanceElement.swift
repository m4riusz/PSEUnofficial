//
//  ApperanceElement.swift
//  iOS
//
//  Created by Mariusz Sut on 02/04/2022.
//

import XCTest

public protocol ApperanceElement {
    var apperanceElement: XCUIElement { get }

    @discardableResult
    func waitForApperance() -> Self
    @discardableResult
    func waitForApperance(timeout: TimeInterval) -> Self
    @discardableResult
    func waitForApperance(message: String) -> Self
    @discardableResult
    func waitForApperance(timeout: TimeInterval, message: String) -> Self
}

public extension ApperanceElement {
    @discardableResult
    func waitForApperance() -> Self {
        waitForApperance(timeout: 5, message: "Element not appeared! \(apperanceElement.description)")
    }

    @discardableResult
    func waitForApperance(timeout: TimeInterval) -> Self {
        waitForApperance(timeout: timeout, message: "Element not appeared! \(apperanceElement.description)")
    }

    @discardableResult
    func waitForApperance(message: String) -> Self {
        waitForApperance(timeout: 5, message: message)
    }

    @discardableResult
    func waitForApperance(timeout: TimeInterval, message: String) -> Self {
        guard apperanceElement.waitForExistence(timeout: timeout) else {
            XCTFail(message)
            return self
        }
        return self
    }
}
