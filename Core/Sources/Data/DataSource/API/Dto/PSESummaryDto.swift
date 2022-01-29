//
//  PSESummaryDto.swift
//  Core
//
//  Created by Mariusz Sut on 29/01/2022.
//

import Foundation

public struct PSESummaryDto {
    public let water: Double
    public let wind: Double
    public let solar: Double
    public let thermal: Double
    public let other: Double
    public let frequency: Double
    public let load: Double
    public let generation: Double
}

// MARK: - Codable
extension PSESummaryDto: Codable {
    enum CodingKeys: String, CodingKey {
        case water = "wodne"
        case wind = "wiatrowe"
        case solar = "PV"
        case thermal = "cieplne"
        case other = "inne"
        case frequency = "czestotliwosc"
        case load = "zapotrzebowanie"
        case generation = "generacja"
    }
}
