//
//  ErrorViewTests.swift
//  iOS
//
//  Created by Mariusz Sut on 19/03/2022.
//

import TestKit
import SnapshotTesting
@testable import iOS

final class ErrorViewTests: BaseUnitTest {
    private var title = "Title Title Title Title Title Title Title Title Title Title"
    private var message = "Message Message Message Message Message Message Message Message Message"
    private var action = "ACTION"
    private lazy var sut = ErrorView(viewModel: .init(title: title,
                                                      message: message,
                                                      action: action,
                                                      onAction: {}))
    
    func testLightMode() {
        assertSnapshot(of: sut, as: .standardImage())
    }

    func testDarkMode() {
        assertSnapshot(of: sut, as: .standardImage(mode: .dark))
    }
}
