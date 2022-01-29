//
//  PSEDataSourceProtocol.swift
//  Core
//
//  Created by Mariusz Sut on 29/01/2022.
//

import Foundation

protocol PSEDataSourceProtocol {
    func getStatus() async throws -> PSEStatus
}
