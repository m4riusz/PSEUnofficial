//
//  AboutViewModelTests.swift
//  iOS
//
//  Created by Mariusz Sut on 23/03/2022.
//

import XCTest
import Core
@testable import iOS

final class AboutViewModelTests: XCTestCase {
    private typealias Literals = Assets.Strings.iOS.About
    private struct Constatns {
        static let repoUrl = "https://github.com/m4riusz/PSEUnofficial"
    }
    private var appInfoProvider = AppInformationProviderProtocolStub()
    private var urlHandler = UrlHandlerMock()
    private lazy var sut = AboutViewModel(appInfoProvider: appInfoProvider, urlHandler: urlHandler)

    func testAppName() async throws {
        appInfoProvider.appName = "Some name"
        let items = await sut.items
        XCTAssertEqual(items.first, .header(text: "Some name"))
    }

    func testNoAppName() async throws {
        let items = await sut.items
        XCTAssertEqual(items.first, .description(text: Literals.description))
    }

    func testRepositoryLink() async throws {
        let items = await sut.items
        XCTAssertEqual(items[1], .link(title: Literals.Link.Repository.title,
                                       linkViewModel: .init(url: URL(string: Constatns.repoUrl)!, tap: {})))
    }

    func testRepositoryLinkAction() async throws {
        let items = await sut.items
        guard case let AboutRowViewModel.link(_, linkViewModel: linkViewModel) = items[1] else {
            XCTFail("Api link item not found")
            return
        }
        linkViewModel.tap()
        XCTAssertEqual(urlHandler.lastOpenedUrl, URL(string: Constatns.repoUrl)!)
    }

    func testApiLink() async throws {
        let items = await sut.items
        XCTAssertEqual(items[2], .link(title: Literals.Link.Api.title,
                                       linkViewModel: .init(url: URL(string: Literals.Link.Api.provider)!, tap: {})))
    }

    func testApiLinkAction() async throws {
        let items = await sut.items
        guard case let AboutRowViewModel.link(_, linkViewModel: linkViewModel) = items[2] else {
            XCTFail("Api link item not found")
            return
        }
        linkViewModel.tap()
        XCTAssertEqual(urlHandler.lastOpenedUrl, URL(string: Literals.Link.Api.provider)!)
    }

    func testIconLink() async throws {
        let items = await sut.items
        XCTAssertEqual(items[3], .link(title: Literals.Link.Icon.title,
                                       linkViewModel: .init(url: URL(string: Literals.Link.Icon.provider)!, tap: {})))
    }

    func testIconLinkAction() async throws {
        let items = await sut.items
        guard case let AboutRowViewModel.link(_, linkViewModel: linkViewModel) = items[3] else {
            XCTFail("Api link item not found")
            return
        }
        linkViewModel.tap()
        XCTAssertEqual(urlHandler.lastOpenedUrl, URL(string: Literals.Link.Icon.provider)!)
    }

    func testVersion() async throws {
        appInfoProvider.appVersion = "1.2.3"
        let items = await sut.items
        XCTAssertEqual(items.last, .version(version: "v1.2.3"))
    }

    func testVersionAndBuild() async throws {
        appInfoProvider.appBuild = "1"
        appInfoProvider.appVersion = "1.2.3"
        let items = await sut.items
        XCTAssertEqual(items.last, .version(version: "v1.2.3 (1)"))
    }

    func testBuild() async throws {
        appInfoProvider.appBuild = "1"
        let items = await sut.items
        XCTAssertEqual(items.last, .version(version: "(1)"))
    }

    func testNoVersionAndNoBuild() async throws {
        let items = await sut.items
        if let lastItem = items.last, case AboutRowViewModel.version = lastItem {
            XCTFail("Last item should not be version (no version anb build is set)")
        }
    }
}
