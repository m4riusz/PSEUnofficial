//
//  AboutUITests.swift
//  iOS
//
//  Created by Mariusz Sut on 02/04/2022.
//

import Foundation

final class AboutUITests: BaseUITest {

    func testSwitchingTabs() throws {
        let page = TabPage()

        page
            .openAboutPage()
        sleep(1)

        page.openStatusPage()

    }
}
