//
//  UrlHandlerProtocol.swift
//  Core
//
//  Created by Mariusz Sut on 23/03/2022.
//

import Foundation

public protocol UrlHandlerProtocol {
    func openUrl(url: URL, completion: ((Bool) -> Void)?)
}
