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

// MARK: - Equatable
extension PSEFlow: Equatable { /* Nop */ }
