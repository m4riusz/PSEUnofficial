//
//  StatusPage.swift
//  iOS
//
//  Created by Mariusz Sut on 03/04/2022.
//

import XCTest
import TestKit

final class StatusPage: Page, ApperanceElement {

    let element: XCUIElement

    init(element: XCUIElement) {
        self.element = element
    }

    var apperanceElement: XCUIElement {
        element
    }
}
