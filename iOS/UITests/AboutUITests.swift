//
//  AboutUITests.swift
//  iOS
//
//  Created by Mariusz Sut on 02/04/2022.
//

import TestKit
import XCTest

final class AboutUITests: BaseUITest {

    private lazy var page = MainPage(application: application)
        .openAboutPage()

    func testElements() {
        page
            .inspect { page in
                let cells = page.cells
                XCTAssertEqual(cells.count, 6)
                XCTAssertTrue(cells[0].isHeader)
                XCTAssertTrue(cells[1].isDescription)
                XCTAssertTrue(cells[2].isLink)
                XCTAssertTrue(cells[3].isLink)
                XCTAssertTrue(cells[4].isLink)
                XCTAssertTrue(cells[5].isVersion)
            }
    }

    func testRepositoryLinkClick() {
        page
            .tapRepositoryLink()
            .back(landOn: page, application: application)
            .tapApiProviderLink()
            .back(landOn: page, application: application)
            .tapIconProviderLink()
            .back(landOn: page, application: application)
    }
}
