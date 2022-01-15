//
//  PSERepositoryProtocol.swift
//  Core
//
//  Created by Mariusz Sut on 15/01/2022.
//

import Foundation

public protocol PSERepositoryProtocol {
    func getStatus() async throws -> PSEStatus
}
