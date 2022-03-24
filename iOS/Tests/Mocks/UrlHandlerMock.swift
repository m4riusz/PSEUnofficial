//
//  UrlHandlerMock.swift
//  iOS
//
//  Created by Mariusz Sut on 23/03/2022.
//

import Core
import Foundation

class UrlHandlerMock: UrlHandlerProtocol {
    var result = true
    private (set) var lastOpenedUrl: URL?

    func openUrl(url: URL, completion: ((Bool) -> Void)?) {
        lastOpenedUrl = url
        completion?(result)
    }
}
