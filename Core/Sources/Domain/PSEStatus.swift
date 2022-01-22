//
//  PSEStatus.swift
//  Core
//
//  Created by Mariusz Sut on 15/01/2022.
//

import Foundation

public struct PSEStatus {
    public let status: String
    public let date: Date
    public let data: PSEData
}

// MARK: Codable
extension PSEStatus: Codable {
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case date = "timestamp"
        case data
    }
}
