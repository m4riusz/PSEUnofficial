//
//  FlowSummaryRowTests.swift
//  iOS
//
//  Created by Mariusz Sut on 05/03/2022.
//

import XCTest
import Core
import TestKit
import SwiftUI
import SnapshotTesting
@testable import iOS

final class FlowSummaryRowTests: XCTestCase {
    private var image: Image?
    private var title = "title"
    private var flowValue = 0.0
    private var formatter = DoubleFormatter(minimumFractionDigits: 0, maximumFractionDigits: 0)
    private lazy var rowType = FlowSummaryRowViewModel.FlowSummaryRowType.primary(value: flowValue, formatter: formatter)
    private lazy var sut = FlowSummaryRow(viewModel: .init(image: image, title: title, rowType: rowType))

    func testNoImageLongTextPrimaryTypeDarkMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testNoImageLongTextPrimaryTypeLightMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testNoImageLongTextSecondaryTypeDarkMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        rowType = .secondary(value: flowValue, formatter: formatter)
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testNoImageLongTextSecondaryTypeLightMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        rowType = .secondary(value: flowValue, formatter: formatter)
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testNoImageLongTextFlowTypeDarkMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        rowType = .flow(value: .init(value: flowValue, orientation: .vertical, formatter: formatter))
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testNoImageLongTextFlowTypeLightMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        rowType = .flow(value: .init(value: flowValue, orientation: .vertical, formatter: formatter))
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testImageLongTextPrimaryTypeDarkMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testImageLongTextPrimaryTypeLightMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testImageLongTextSecondaryTypeDarkMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        rowType = .secondary(value: flowValue, formatter: formatter)
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testImageLongTextSecondaryTypeLightMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        rowType = .secondary(value: flowValue, formatter: formatter)
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testImageLongTextFlowTypeImportDarkMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        flowValue = 100
        rowType = .flow(value: .init(value: flowValue, orientation: .vertical, formatter: formatter))
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testImageLongTextFlowTypeImportLightMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        flowValue = 100
        rowType = .flow(value: .init(value: flowValue, orientation: .vertical, formatter: formatter))
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testImageLongTextFlowTypeExportDarkMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        flowValue = -100
        rowType = .flow(value: .init(value: flowValue, orientation: .vertical, formatter: formatter))
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testImageLongTextFlowTypeExportLightMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        flowValue = -100
        rowType = .flow(value: .init(value: flowValue, orientation: .vertical, formatter: formatter))
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testImageLongTextFlowTypeNoneDarkMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        rowType = .flow(value: .init(value: flowValue, orientation: .vertical, formatter: formatter))
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testImageLongTextFlowTypeNoneLightMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        rowType = .flow(value: .init(value: flowValue, orientation: .vertical, formatter: formatter))
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testFormatterFlowTypeImportDarkMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        flowValue = 100
        formatter = DoubleFormatter(minimumFractionDigits: 5, maximumFractionDigits: 5)
        rowType = .flow(value: .init(value: flowValue, orientation: .vertical, formatter: formatter))
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testFormatterFlowTypeImportLightMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        flowValue = 100
        formatter = DoubleFormatter(minimumFractionDigits: 5, maximumFractionDigits: 5)
        rowType = .flow(value: .init(value: flowValue, orientation: .vertical, formatter: formatter))
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testFormatterFlowTypeExportDarkMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        flowValue = -100
        formatter = DoubleFormatter(minimumFractionDigits: 5, maximumFractionDigits: 5)
        rowType = .flow(value: .init(value: flowValue, orientation: .vertical, formatter: formatter))
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testFormatterFlowTypeExportLightMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        flowValue = -100
        formatter = DoubleFormatter(minimumFractionDigits: 5, maximumFractionDigits: 5)
        rowType = .flow(value: .init(value: flowValue, orientation: .vertical, formatter: formatter))
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testFormatterFlowTypeNoneDarkMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        flowValue = 0
        formatter = DoubleFormatter(minimumFractionDigits: 5, maximumFractionDigits: 5)
        rowType = .flow(value: .init(value: flowValue, orientation: .vertical, formatter: formatter))
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testFormatterFlowTypeNoneLightMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        image = Assets.Images.iOS.germany
        flowValue = 0
        formatter = DoubleFormatter(minimumFractionDigits: 5, maximumFractionDigits: 5)
        rowType = .flow(value: .init(value: flowValue, orientation: .vertical, formatter: formatter))
        assertSnapshot(matching: sut, as: .standardImage())
    }
}
