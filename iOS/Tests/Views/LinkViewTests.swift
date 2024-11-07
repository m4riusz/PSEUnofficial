//
//  LinkViewTests.swift
//  iOS
//
//  Created by Mariusz Sut on 23/03/2022.
//

import Core
import XCTest
import SwiftUI
import TestKit
import SnapshotTesting
@testable import iOS

final class LinkViewTests: BaseUnitTest {
    private struct Constants {
        static let size = CGSize(width: 120, height: 0)
    }
    private var flowValue = 100.0
    private var text: String?
    private var url = URL(string: "https://onet.pl")!
    private lazy var sut = LinkView(viewModel: .init(text: text, url: url, tap: { }))

    func testNoTextLightMode() {
        assertSnapshot(of: sut, as: .standardImage(size: Constants.size))
    }

    func testNoTextDarkMode() {
        assertSnapshot(of: sut, as: .standardImage(size: Constants.size, mode: .dark))
    }

    func testTextLightMode() {
        text = "Hello"
        assertSnapshot(of: sut, as: .standardImage(size: Constants.size))
    }

    func testTextDarkMode() {
        text = "Hello"
        assertSnapshot(of: sut, as: .standardImage(size: Constants.size, mode: .dark))
    }
}
