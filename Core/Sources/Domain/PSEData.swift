//
//  PSEData.swift
//  Core
//
//  Created by Mariusz Sut on 15/01/2022.
//

import Foundation

public struct PSEData {
    public let flows: [PSEFlow]
    public let summary: PSESummary
}

// MARK: - Codable
extension PSEData: Codable {
    enum CodingKeys: String, CodingKey {
        case flows = "przesyly"
        case summary = "podsumowanie"
    }
}
