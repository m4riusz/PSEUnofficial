//
//  AboutPage.swift
//  iOS
//
//  Created by Mariusz Sut on 03/04/2022.
//

import XCTest
import TestKit

final class AboutPage: Page, ApperanceElement {
    private struct Constants {
        static let repositoryCellIndex = 2
        static let apiProviderCellIndex = 3
        static let iconProviderCellIndex = 4
    }
    let element: XCUIElement

    init(element: XCUIElement) {
        self.element = element
    }

    var apperanceElement: XCUIElement {
        listElement
    }

    var cells: [AboutRowCellPage] {
        listCells.map { .init(element: $0) }
    }

    @discardableResult
    func tapRepositoryLink() -> SafariPage {
        cells[Constants.repositoryCellIndex].link
            .tapOnLink(landOn: SafariPage())
            .waitForApperance()
    }

    @discardableResult
    func tapApiProviderLink() -> SafariPage {
        cells[Constants.apiProviderCellIndex].link
            .tapOnLink(landOn: SafariPage())
            .waitForApperance()
    }

    @discardableResult
    func tapIconProviderLink() -> SafariPage {
        cells[Constants.iconProviderCellIndex].link
            .tapOnLink(landOn: SafariPage())
            .waitForApperance()
    }

    private var listElement: XCUIElement {
        element.firstMatch
    }

    private var listCells: [XCUIElement] {
        listElement.cells.allElementsBoundByIndex
    }
}
