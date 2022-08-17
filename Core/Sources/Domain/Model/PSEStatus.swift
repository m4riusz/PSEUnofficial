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

// MARK: - Equatable
extension PSEStatus: Equatable { /* Nop */ }

extension PSEStatus {
    public static var placeholder: PSEStatus {
        .init(status: "",
              date: .now,
              data: .init(flows: [.init(direction: .slovakia,
                                        value: 100,
                                        parallel: false,
                                        planned: 120),
                                  .init(direction: .germany,
                                        value: 123,
                                        parallel: true,
                                        planned: 321)],
                          summary: .init(water: 100,
                                         wind: 200,
                                         solar: 300,
                                         thermal: 400,
                                         other: 500,
                                         frequency: 600,
                                         load: 700,
                                         generation: 800)))
    }
}
