//
//  Page.swift
//  iOS
//
//  Created by Mariusz Sut on 02/04/2022.
//

import Foundation
import XCTest

protocol Page {
    var element: XCUIElement { get }

    func inspect(_ callback: (_ page: Self) -> Void) -> Self
}

extension Page {

    @discardableResult
    func inspect(_ callback: (_ page: Self) -> Void) -> Self {
        callback(self)
        return self
    }
}
