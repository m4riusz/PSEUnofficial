//
//  MainViewUITests.swift
//  iOS
//
//  Created by Mariusz Sut on 03/04/2022.
//

import XCTest
import TestKit

final class MainViewUITests: BaseUITest {

    func testSwitchingTabs() throws {
        let page = MainPage(application: application)
        page.openAboutPage()
        page.openStatusPage()
    }
}
