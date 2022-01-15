//
//  PSEDirection.swift
//  Core
//
//  Created by Mariusz Sut on 15/01/2022.
//

import Foundation

public enum PSEDirection: String {
    case sweden = "SE"
    case germany = "DE"
    case czech = "CZ"
    case slovakia = "SK"
    case ukraine = "UA"
    case lithuania = "LT"
}

// MARK: - Codable
extension PSEDirection: Codable { /*Nop*/ }
