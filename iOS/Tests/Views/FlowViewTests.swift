//
//  FlowViewTests.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import Core
import XCTest
import SwiftUI
import SnapshotTesting
@testable import iOS

final class FlowViewTests: XCTestCase {
    private var flowValue = 100.0
    private var orientation = FlowViewModel.Orientation.horizontal
    private var formatter = DoubleFormatter(minimumFractionDigits: 0, maximumFractionDigits: 0)
    private lazy var sut = FlowView(viewModel: .init(value: flowValue,
                                                     orientation: orientation,
                                                     formatter: formatter))

    func testHorizontalImportLightMode() {
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testHorizontalExportLightMode() {
        flowValue = -100
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testHorizontalNoneLightMode() {
        flowValue = 0
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testHorizontalImportDarkMode() {
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testHorizontalExportDarkMode() {
        flowValue = -100
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testHorizontalNoneDarkMode() {
        flowValue = 0
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testVerticalImportLightMode() {
        orientation = .vertical
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testVerticalExportLightMode() {
        orientation = .vertical
        flowValue = -100
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testVerticalNoneLightMode() {
        orientation = .vertical
        flowValue = 0
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testVerticalImportDarkMode() {
        orientation = .vertical
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testVerticalExportDarkMode() {
        orientation = .vertical
        flowValue = -100
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testVerticalNoneDarkMode() {
        orientation = .vertical
        flowValue = 0
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testFormatterHorizontalLightMode() {
        flowValue = -100
        formatter = DoubleFormatter(minimumFractionDigits: 3, maximumFractionDigits: 3)
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testFormatterHorizontalDarkMode() {
        flowValue = -100
        formatter = DoubleFormatter(minimumFractionDigits: 3, maximumFractionDigits: 3)
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testFormatterVerticalLightMode() {
        orientation = .vertical
        flowValue = -100
        formatter = DoubleFormatter(minimumFractionDigits: 3, maximumFractionDigits: 3)
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testFormatterVerticalDarkMode() {
        orientation = .vertical
        flowValue = -100
        formatter = DoubleFormatter(minimumFractionDigits: 3, maximumFractionDigits: 3)
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }
}

extension Snapshotting where Value: SwiftUI.View, Format == UIImage {
    public static func standardImage(size: CGSize = CGSize(width: 375, height: 0),
                                     mode: UIUserInterfaceStyle = .light) -> Snapshotting {
        .image(precision: 0.99,
               layout: .fixed(width: size.width, height: size.height),
               traits: UITraitCollection(userInterfaceStyle: mode))
    }
}
