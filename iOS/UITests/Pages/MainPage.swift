//
//  MainPage.swift
//  iOS
//
//  Created by Mariusz Sut on 02/04/2022.
//

import TestKit
import XCTest
import Foundation

final class MainPage: Page {
    private struct Constants {
        static let statusIndex = 0
        static let aboutIndex = 1
        static let aboutViewListIdentifier = "AboutViewListIdentifier"
        static let powerStatusViewIdentifier = "PowerStatusViewIdentifier"
    }
    private let application: XCUIApplication

    init(application: XCUIApplication) {
        self.application = application
    }

    var element: XCUIElement {
        application
    }

    @discardableResult
    func openAboutPage() -> AboutPage {
        aboutTabElement.tap()
        return AboutPage(element: aboutTabContentElement)
            .waitForApperance()
    }

    @discardableResult
    func openStatusPage() -> StatusPage {
        statusTabElement.tap()
        return StatusPage(element: statusTabContentElement)
            .waitForApperance()
    }

    private var tabBarButtons: [XCUIElement] {
        element
            .buttons
            .allElementsBoundByIndex
    }

    private var statusTabContentElement: XCUIElement {
        element.tables[Constants.powerStatusViewIdentifier].firstMatch
    }

    private var aboutTabContentElement: XCUIElement {
        element.tables[Constants.aboutViewListIdentifier].firstMatch
    }

    private var aboutTabElement: XCUIElement {
        tabBarButtons[Constants.aboutIndex]
    }

    private var statusTabElement: XCUIElement {
        tabBarButtons[Constants.statusIndex]
    }
}
