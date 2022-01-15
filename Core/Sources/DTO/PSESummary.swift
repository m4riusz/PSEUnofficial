//
//  PSESummary.swift
//  Core
//
//  Created by Mariusz Sut on 15/01/2022.
//

import Foundation

struct PSESummary {
    let water: Double
    let wind: Double
    let solar: Double
    let thermal: Double
    let other: Double
    let frequency: Double
    let load: Double
    let generation: Double
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
