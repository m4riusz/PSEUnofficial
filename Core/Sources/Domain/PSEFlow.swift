//
//  PSEFlow.swift
//  Core
//
//  Created by Mariusz Sut on 15/01/2022.
//

import Foundation

public struct PSEFlow {
    public let direction: PSEDirection
    public let value: Double
    public let parallel: Bool
    public let planned: Double
}

// MARK: - Codable
extension PSEFlow: Codable {
    enum CodingKeys: String, CodingKey {
        case direction = "id"
        case value = "wartosc"
        case parallel = "rownolegly"
        case planned = "wartosc_plan"
    }
}
