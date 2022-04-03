//
//  SafariPage.swift
//  iOS
//
//  Created by Mariusz Sut on 03/04/2022.
//

import Foundation
import XCTest

final class SafariPage: Page, ApperanceElement {
    private struct Constants {
        static let safariBundleIdentifier = "com.apple.mobilesafari"
    }
    let safari = XCUIApplication(bundleIdentifier: Constants.safariBundleIdentifier)

    var element: XCUIElement {
        safari.firstMatch
    }

    var apperanceElement: XCUIElement {
        safari.firstMatch
    }

    @discardableResult
    func back<T: Page & ApperanceElement>(landOn page: T, application: XCUIApplication) -> T {
        application.activate()
        page.waitForApperance()
        return page
    }
}
