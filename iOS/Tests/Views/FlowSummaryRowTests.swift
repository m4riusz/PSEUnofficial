//
//  FlowSummaryRowTests.swift
//  iOS
//
//  Created by Mariusz Sut on 05/03/2022.
//

import XCTest
import Core
import SwiftUI
import SnapshotTesting
@testable import iOS

final class FlowSummaryRowTests: XCTestCase {
    private var image: Image?
    private var title = "title"
    private var value = 0.0
    private var valueFractionDigits = 0
    private var valueDetails: String?
    private var valueColor: Color = Assets.Colors.iOS.textPrimary
    private lazy var sut = FlowSummaryRow(viewModel: .init(image: image,
                                                           title: title,
                                                           value: value,
                                                           valueFractionDigits: valueFractionDigits,
                                                           valueDetail: valueDetails,
                                                           valueColor: valueColor))
    func testNoImageDarkMode() {
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testNoImageLightMode() {
        assertSnapshot(matching: sut, as: .standardImage(mode: .light))
    }

    func testImageDarkMode() {
        image = Assets.Images.iOS.germany
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testImageLightMode() {
        image = Assets.Images.iOS.germany
        assertSnapshot(matching: sut, as: .standardImage(mode: .light))
    }

    func testManyValueFractionDigitsDarkMode() {
        valueFractionDigits = 6
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testManyValueFractionDigitsLightMode() {
        valueFractionDigits = 6
        assertSnapshot(matching: sut, as: .standardImage(mode: .light))
    }

    func testValueDetailsWithColorDarkMode() {
        valueDetails = "import"
        valueColor = .green
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testValueDetailsWithColorLightMode() {
        valueDetails = "import"
        valueColor = .green
        assertSnapshot(matching: sut, as: .standardImage(mode: .light))
    }

    func testLongTitleDarkMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testLongTitleLightMode() {
        title = "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet"
        assertSnapshot(matching: sut, as: .standardImage(mode: .light))
    }
}
