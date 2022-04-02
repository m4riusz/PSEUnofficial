//
//  TabPage.swift
//  iOS
//
//  Created by Mariusz Sut on 02/04/2022.
//

import XCTest
import Foundation

final class AboutPage: Page, ApperanceElement {

    var apperanceElement: XCUIElement {
        application
    }
}

final class StatusPage: Page, ApperanceElement {

    var apperanceElement: XCUIElement {
        application
    }
}

final class TabPage: Page {
    private struct Constants {
        static let statusIndex = 0
        static let aboutIndex = 1
    }
    @discardableResult
    func openAboutPage() -> AboutPage {
        aboutTabElement.tap()
        return AboutPage()
            .waitForApperance()
    }

    @discardableResult
    func openStatusPage() -> StatusPage {
        statusTabElement.tap()
        return StatusPage()
            .waitForApperance()
    }

    private var tabBarButtons: [XCUIElement] {
        application
            .tabBars
            .firstMatch
            .buttons
            .allElementsBoundByIndex
    }
    private var aboutTabElement: XCUIElement {
        tabBarButtons[Constants.aboutIndex]
    }

    private var statusTabElement: XCUIElement {
        tabBarButtons[Constants.statusIndex]
    }
}
