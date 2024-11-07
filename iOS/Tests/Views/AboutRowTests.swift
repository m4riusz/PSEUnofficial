//
//  AboutRowTests.swift
//  iOS
//
//  Created by Mariusz Sut on 24/03/2022.
//

import Core
import XCTest
import TestKit
import SnapshotTesting
@testable import iOS

final class AboutRowTests: BaseUnitTest {
    private var viewModel = AboutRowViewModel.header(text: "Text")
    private lazy var sut = AboutRow(viewModel: viewModel)

    func testHeaderLightMode() {
        assertSnapshot(of: sut, as: .standardImage())
    }

    func testHeaderDarkMode() {
        assertSnapshot(of: sut, as: .standardImage(mode: .dark))
    }

    func testDescriptionLightMode() {
        viewModel = .description(text: "Description")
        assertSnapshot(of: sut, as: .standardImage())
    }

    func testDescriptiomDarkMode() {
        viewModel = .description(text: "Description")
        assertSnapshot(of: sut, as: .standardImage(mode: .dark))
    }

    func testLinkLightMode() {
        viewModel = .link(title: "Title",
                          linkViewModel: .init(url: URL(string: "https://onet.pl")!, tap: { }))
        assertSnapshot(of: sut, as: .standardImage())
    }

    func testLinkDarkMode() {
        viewModel = .link(title: "Title",
                          linkViewModel: .init(url: URL(string: "https://onet.pl")!, tap: { }))
        assertSnapshot(of: sut, as: .standardImage(mode: .dark))
    }

    func testVersionLightMode() {
        viewModel = .version(version: "v1.0(1)")
        assertSnapshot(of: sut, as: .standardImage())
    }

    func testVersionDarkMode() {
        viewModel = .version(version: "v1.0(1)")
        assertSnapshot(of: sut, as: .standardImage(mode: .dark))
    }
}
