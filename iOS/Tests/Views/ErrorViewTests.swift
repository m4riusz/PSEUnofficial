//
//  ErrorViewTests.swift
//  iOS
//
//  Created by Mariusz Sut on 19/03/2022.
//

import Core
import XCTest
import SwiftUI
import SnapshotTesting
@testable import iOS

final class ErrorViewTests: XCTestCase {
    private struct Constants {
        static let size = CGSize(width: 375, height: 375)
    }
    private var title = "Title Title Title Title Title Title Title Title Title Title"
    private var message = "Message Message Message Message Message Message Message Message Message"
    private var action = "ACTION"
    private lazy var sut = ErrorView(viewModel: .init(title: title,
                                                      message: message,
                                                      action: action,
                                                      onAction: {}))

    func testLightMode() {
        assertSnapshot(matching: sut, as: .standardImage(size: Constants.size))
    }

    func testDarkMode() {
        assertSnapshot(matching: sut, as: .standardImage(size: Constants.size, mode: .dark))
    }
}
