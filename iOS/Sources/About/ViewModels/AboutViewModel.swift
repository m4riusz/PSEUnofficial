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
    private let appInfoProvider: AppInformationProviderProtocol
    private let urlHandler: UrlHandlerProtocol
    private let apiProviderUrl = URL(string: Literals.Link.Api.provider)!
    private let iconProviderUrl = URL(string: Literals.Link.Icon.provider)!

    let aboutDescription = Literals.description
    let apiProviderTitle = Literals.Link.Api.title
    let iconProviderTitle =  Literals.Link.Icon.title

    lazy var apiLink = LinkViewModel(url: apiProviderUrl) { [weak self] in
        guard let strongSelf = self else { return }
        strongSelf.urlHandler.openUrl(url: strongSelf.apiProviderUrl, completion: nil)
    }
    lazy var iconLink = LinkViewModel(url: iconProviderUrl) { [weak self] in
        guard let strongSelf = self else { return }
        strongSelf.urlHandler.openUrl(url: strongSelf.iconProviderUrl, completion: nil)
    }

    nonisolated init(appInfoProvider: AppInformationProviderProtocol, urlHandler: UrlHandlerProtocol) {
        self.appInfoProvider = appInfoProvider
        self.urlHandler = urlHandler
    }

    var appName: String {
        appInfoProvider.appName ?? ""
    }

    var versionWithBuild: String {
        "v\(appInfoProvider.appVersion ?? "")(\(appInfoProvider.appBuild ?? ""))"
    }
}
