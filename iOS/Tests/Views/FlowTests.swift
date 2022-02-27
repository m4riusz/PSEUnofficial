//
//  FlowTests.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import iOS

final class FlowTests: XCTestCase {
    private var flowName = "Aktualne"
    private var flowValue = 100.0
    private lazy var sut = Flow(viewModel: .init(name: flowName, value: flowValue))

    func testImportLightMode() {
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testExportLightMode() {
        flowValue = -100
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testNoneLightMode() {
        flowValue = 0
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testVeryLongTextsLightMode() {
        flowName = "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet"
        flowValue = 1234567890
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testImportDarkMode() {
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testExportDarkMode() {
        flowValue = -100
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testNoneDarkMode() {
        flowValue = 0
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testVeryLongTextsDarkMode() {
        flowName = "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet"
        flowValue = 1234567890
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }
}

extension Snapshotting where Value: SwiftUI.View, Format == UIImage {
    public static func standardImage(mode: UIUserInterfaceStyle = .light) -> Snapshotting {
        .image(layout: .fixed(width: 375, height: 0), traits: UITraitCollection(userInterfaceStyle: mode))
    }
}
