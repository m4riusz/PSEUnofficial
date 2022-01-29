//
//  PSEFlowDto.swift
//  Core
//
//  Created by Mariusz Sut on 29/01/2022.
//

import Foundation

public struct PSEFlowDto {
    public let direction: PSEDirectionDto
    public let value: Double
    public let parallel: Bool
    public let planned: Double
}

// MARK: - Codable
extension PSEFlowDto: Codable {
    enum CodingKeys: String, CodingKey {
        case direction = "id"
        case value = "wartosc"
        case parallel = "rownolegly"
        case planned = "wartosc_plan"
    }
}
