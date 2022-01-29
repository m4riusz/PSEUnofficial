//
//  PSEStatusDto.swift
//  Core
//
//  Created by Mariusz Sut on 29/01/2022.
//

import Foundation

public struct PSEStatusDto {
    public let status: String
    public let date: Date
    public let data: PSEDataDto
}

// MARK: Codable
extension PSEStatusDto: Codable {
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case date = "timestamp"
        case data
    }
}
