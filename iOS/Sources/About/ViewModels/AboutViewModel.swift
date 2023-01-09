//
//  AboutViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 19/03/2022.
//

import Core
import Foundation

@MainActor
final class AboutViewModel: ObservableObject {
    private typealias Literals = Assets.Strings.iOS.About
    private struct Constants {
        static let repoUrl = "https://github.com/m4riusz/PSEUnofficial"
    }
    private let appInfoProvider: AppInformationProviderProtocol
    private let urlHandler: UrlHandlerProtocol

    nonisolated init(appInfoProvider: AppInformationProviderProtocol, urlHandler: UrlHandlerProtocol) {
        self.appInfoProvider = appInfoProvider
        self.urlHandler = urlHandler
    }

    var items: [AboutRowViewModel] {
        [appNameViewModel,
         descriptionViewModel,
         repositoryLinkViewModel,
         apiLinkViewModel,
         iconLinkViewModel,
         versionViewModel].compactMap { $0 }
    }

    private var appNameViewModel: AboutRowViewModel? {
        guard let appName = appInfoProvider.appName else { return nil }
        return .header(text: appName)
    }

    private var descriptionViewModel: AboutRowViewModel {
        .description(text: Literals.description)
    }

    private var apiLinkViewModel: AboutRowViewModel? {
        guard let url = URL(string: Literals.Link.Api.provider) else {
            return nil
        }
        return .link(title: Literals.Link.Api.title, linkViewModel: .init(url: url, tap: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.urlHandler.openUrl(url: url, completion: nil)
        }))
    }

    private var iconLinkViewModel: AboutRowViewModel? {
        guard let url = URL(string: Literals.Link.Icon.provider) else {
            return nil
        }
        return .link(title: Literals.Link.Icon.title, linkViewModel: .init(url: url, tap: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.urlHandler.openUrl(url: url, completion: nil)
        }))
    }

    private var repositoryLinkViewModel: AboutRowViewModel? {
        guard let url = URL(string: Constants.repoUrl) else {
            return nil
        }
        return .link(title: Literals.Link.Repository.title, linkViewModel: .init(url: url, tap: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.urlHandler.openUrl(url: url, completion: nil)
        }))
    }

    private var versionViewModel: AboutRowViewModel? {
        switch (appInfoProvider.appVersion, appInfoProvider.appBuild) {
        case (.none, .none):
            return nil
        case let (.some(version), .none):
            return .version(version: "v\(version)")
        case let (.none, .some(build)):
            return .version(version: "(\(build))")
        case let (.some(version), .some(build)):
            return .version(version: "v\(version) (\(build))")
        }
    }
}
