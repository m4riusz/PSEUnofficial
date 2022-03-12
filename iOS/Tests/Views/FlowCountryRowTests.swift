//
//  FlowCountryRowTests.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import XCTest
import Core
import SwiftUI
import SnapshotTesting
@testable import iOS

final class FlowCountryRowTests: XCTestCase {
    private var country = PSEDirection.sweden
    private var currentValue = 100.0
    private var plannedValue = 200.0
    private var formatter = DoubleFormatter(minimumFractionDigits: 0,
                                             maximumFractionDigits: 0)
    private lazy var sut = FlowCountryRow(viewModel: .init(country: country,
                                                           currentValue: currentValue,
                                                           plannedValue: plannedValue,
                                                           doubleFormatter: formatter))

    func testCurrentImportPlannedImportLightMode() {
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testCurrentImportPlannedExportLightMode() {
        plannedValue = -200
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testCurrentExportPlannedImportLightMode() {
        currentValue = -200
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testCurrentExportPlannedExportLightMode() {
        currentValue = -100
        plannedValue = -200
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testCurrentImportPlannedImportDarkMode() {
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testCurrentImportPlannedExportDarkMode() {
        plannedValue = -200
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testCurrentExportPlannedImportDarkMode() {
        currentValue = -200
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testCurrentExportPlannedExportDarkMode() {
        currentValue = -100
        plannedValue = -200
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testDifferentFormatterLightMode() {
        formatter = DoubleFormatter(minimumFractionDigits: 3, maximumFractionDigits: 3)
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testDifferentFormatterDarkMode() {
        formatter = DoubleFormatter(minimumFractionDigits: 3, maximumFractionDigits: 3)
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }
}
