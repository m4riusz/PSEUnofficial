//
//  LinkViewTests.swift
//  iOS
//
//  Created by Mariusz Sut on 23/03/2022.
//

import Core
import XCTest
import SwiftUI
import SnapshotTesting
@testable import iOS

final class LinkViewTests: XCTestCase {
    private struct Constants {
        static let size = CGSize(width: 0, height: 0)
    }
    private var flowValue = 100.0
    private var text: String?
    private var url = URL(string: "https://onet.pl")!
    private lazy var sut = LinkView(viewModel: .init(text: text, url: url, tap: { }))

    func testNoTextLightMode() {
        assertSnapshot(matching: sut, as: .standardImage(size: Constants.size))
    }

    func testNoTextDarkMode() {
        assertSnapshot(matching: sut, as: .standardImage(size: Constants.size, mode: .dark))
    }

    func testTextLightMode() {
        text = "Hello"
        assertSnapshot(matching: sut, as: .standardImage(size: Constants.size))
    }

    func testTextDarkMode() {
        text = "Hello"
        assertSnapshot(matching: sut, as: .standardImage(size: Constants.size, mode: .dark))
    }
}
