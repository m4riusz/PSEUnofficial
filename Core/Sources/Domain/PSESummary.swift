//
//  PSESummary.swift
//  Core
//
//  Created by Mariusz Sut on 15/01/2022.
//

import Foundation

public struct PSESummary {
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
extension PSESummary: Codable {
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
