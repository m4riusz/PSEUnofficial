//
//  Page.swift
//  iOS
//
//  Created by Mariusz Sut on 02/04/2022.
//

import Foundation
import XCTest

protocol Page {
    var application: XCUIApplication { get }
}

extension Page {
    var application: XCUIApplication {
        XCUIApplication()
    }
}
