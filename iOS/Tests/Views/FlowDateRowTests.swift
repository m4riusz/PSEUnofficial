//
//  FlowDateRowTests.swift
//  iOS
//
//  Created by Mariusz Sut on 19/03/2022.
//

import Core
import XCTest
import SwiftUI
import SnapshotTesting
@testable import iOS

final class FlowDateRowTests: XCTestCase {
    private var date = Date(timeIntervalSince1970: 1647365378)
    private var freshData = true
    private lazy var sut = FlowDateRow(viewModel: .init(date: date, freshData: freshData))

    func testFreshDataLightMode() {
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testFreshDataDarkMode() {
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }

    func testNonFreshDataLightMode() {
        freshData = false
        assertSnapshot(matching: sut, as: .standardImage())
    }

    func testNonFreshDataDarkMode() {
        freshData = false
        assertSnapshot(matching: sut, as: .standardImage(mode: .dark))
    }
}
