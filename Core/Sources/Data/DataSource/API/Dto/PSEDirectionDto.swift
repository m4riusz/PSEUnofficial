//
//  PSEDirectionDto.swift
//  Core
//
//  Created by Mariusz Sut on 29/01/2022.
//

import Foundation

public enum PSEDirectionDto: String {
    case sweden = "SE"
    case germany = "DE"
    case czech = "CZ"
    case slovakia = "SK"
    case ukraine = "UA"
    case lithuania = "LT"
}

// MARK: - Codable
extension PSEDirectionDto: Codable { /*Nop*/ }
