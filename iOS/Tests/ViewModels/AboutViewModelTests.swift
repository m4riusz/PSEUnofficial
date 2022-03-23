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
    
    private var appInfoProvider = AppInformationProviderProtocolStub()
    private var urlHandler = UrlHandlerMock()
    private lazy var sut = AboutViewModel(appInfoProvider: appInfoProvider, urlHandler: urlHandler)
    
}
