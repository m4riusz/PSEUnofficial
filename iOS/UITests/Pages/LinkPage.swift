//
//  LinkPage.swift
//  iOS
//
//  Created by Mariusz Sut on 03/04/2022.
//

import XCTest
import TestKit

final class LinkPage: Page {
    let element: XCUIElement

    init(element: XCUIElement) {
        self.element = element
    }

    @discardableResult
    func tapOnLink<T: Page & ApperanceElement>(landOn page: T) -> T {
        element.tap()
        page.waitForApperance()
        return page
    }
}
