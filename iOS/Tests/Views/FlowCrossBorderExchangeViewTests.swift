//
//  FlowCrossBorderExchangeViewTests.swift
//  iOSTests
//
//  Created by Mariusz Sut on 12/03/2022.
//

import Core
import XCTest
import SwiftUI
import SnapshotTesting
@testable import iOS

final class FlowCrossBorderExchangeViewTests: XCTestCase {
    private var title = "title"
    private var currentValue = 100.0
    private var plannedValue = 200.0
    private var formatter = DoubleFormatter(minimumFractionDigits: 0, maximumFractionDigits: 0)
    private lazy var sut = FlowCrossBorderExchangeRow(viewModel: .init(title: title,
                                                                       current: currentValue,
                                                                       planned: plannedValue,
                                                                       formatter: formatter))
    func testImportAndImportLightMode() {
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testImportAndImportDarkMode() {
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testImportAndExportLightMode() {
        plannedValue = -200
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testImportAndExportDarkMode() {
        plannedValue = -200
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testExportAndImportLightMode() {
        currentValue = -100
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testExportAndImportDarkMode() {
        currentValue = -100
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testExportAndExportLightMode() {
        currentValue = -100
        plannedValue = -200
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testExportAndExportDarkMode() {
        currentValue = -100
        plannedValue = -200
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testFormatterAndLongTitle() {
        currentValue = -100
        plannedValue = -200
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        formatter = DoubleFormatter(minimumFractionDigits: 5, maximumFractionDigits: 5)
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }
}
