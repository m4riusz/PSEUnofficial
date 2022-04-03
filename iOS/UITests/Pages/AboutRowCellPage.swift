//
//  AboutRowCellPage.swift
//  iOS
//
//  Created by Mariusz Sut on 03/04/2022.
//

import XCTest

final class AboutRowCellPage: Page {
    private struct Constants {
        static let headerIdentifier = "AboutRowHeaderIdentifier"
        static let descriptionIdentifier = "AboutRowDescriptionIdentifier"
        static let linkTitleIdentifier = "AboutRowLinkTitleIdentifier"
        static let linkIdentifier = "AboutRowLinkIdentifier"
        static let versionIdentifier = "AboutRowVersionIdentifier"
    }
    let element: XCUIElement

    init(element: XCUIElement) {
        self.element = element
    }

    var isHeader: Bool {
        headerElement.exists
    }

    var isDescription: Bool {
        descriptionElement.exists
    }

    var isLink: Bool {
        linkTitleElement.exists
    }

    var link: LinkPage {
        LinkPage(element: linkElement)
    }

    var isVersion: Bool {
        versionElement.exists
    }

    private var headerElement: XCUIElement {
        element.staticTexts[Constants.headerIdentifier]
    }

    private var descriptionElement: XCUIElement {
        element.staticTexts[Constants.descriptionIdentifier]
    }

    private var linkTitleElement: XCUIElement {
        element.staticTexts[Constants.linkTitleIdentifier]
    }

    private var linkElement: XCUIElement {
        element.staticTexts[Constants.linkIdentifier]
    }

    private var versionElement: XCUIElement {
        element.staticTexts[Constants.versionIdentifier]
    }
}
