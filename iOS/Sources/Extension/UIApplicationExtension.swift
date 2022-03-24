//
//  UIApplicationExtension.swift
//  iOS
//
//  Created by Mariusz Sut on 23/03/2022.
//

import Core
import UIKit

extension UIApplication: UrlHandlerProtocol {
    public func openUrl(url: URL, completion: ((Bool) -> Void)?) {
        open(url, options: [:], completionHandler: completion)
    }
}
