//
//  NSErrorExtension.swift
//  Core
//
//  Created by Mariusz Sut on 14/04/2022.
//

import Foundation

extension NSError {
    convenience init(message: String, code: Int = 999) {
        self.init(domain: "pl.msut", code: code, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
