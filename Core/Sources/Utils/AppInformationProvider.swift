//
//  AppInformationProvider.swift
//  Core
//
//  Created by Mariusz Sut on 19/03/2022.
//

import Foundation

public protocol AppInformationProviderProtocol {
    var appName: String? { get }
    var appVersion: String? { get }
    var appBuild: String? { get }
}

final class AppInformationProvider: AppInformationProviderProtocol {
    private struct Constants {
        static let version = "CFBundleShortVersionString"
        static let appBuild = kCFBundleVersionKey as String
        static let appName = kCFBundleNameKey as String
    }
    private let bundle: Bundle

    var appName: String? {
        bundle.infoDictionary?[Constants.appName] as? String
    }

    var appVersion: String? {
        bundle.infoDictionary?[Constants.version] as? String
    }

    var appBuild: String? {
        bundle.infoDictionary?[Constants.appBuild] as? String
    }

    init(bundle: Bundle) {
        self.bundle = bundle
    }
}
