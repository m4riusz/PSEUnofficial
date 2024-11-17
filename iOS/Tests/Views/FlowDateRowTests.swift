//
//  FlowDateRowTests.swift
//  iOS
//
//  Created by Mariusz Sut on 19/03/2022.
//

import Core
import XCTest
import TestKit
import SnapshotTesting
@testable import iOS

final class FlowDateRowTests: BaseUnitTest {
    private var freshData = true
    private lazy var sut = FlowDateRow(viewModel: .init(formattedDate: "15.03.2022 o 18:29:38",
                                                        freshData: freshData))

    func testFreshDataLightMode() {
        assertSnapshot(of: sut, as: .standardImage())
    }

    func testFreshDataDarkMode() {
        assertSnapshot(of: sut, as: .standardImage(mode: .dark))
    }

    func testNonFreshDataLightMode() {
        freshData = false
        assertSnapshot(of: sut, as: .standardImage())
    }

    func testNonFreshDataDarkMode() {
        freshData = false
        assertSnapshot(of: sut, as: .standardImage(mode: .dark))
    }
}
