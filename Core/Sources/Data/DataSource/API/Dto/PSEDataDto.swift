//
//  PSEDataDto.swift
//  Core
//
//  Created by Mariusz Sut on 29/01/2022.
//

import Foundation

public struct PSEDataDto {
    public let flows: [PSEFlowDto]
    public let summary: PSESummaryDto
}

// MARK: - Codable
extension PSEDataDto: Codable {
    enum CodingKeys: String, CodingKey {
        case flows = "przesyly"
        case summary = "podsumowanie"
    }
}
