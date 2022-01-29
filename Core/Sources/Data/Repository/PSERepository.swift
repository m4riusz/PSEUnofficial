//
//  PSERepository.swift
//  Core
//
//  Created by Mariusz Sut on 15/01/2022.
//

import Combine
import Foundation

class PSERepository: PSERepositoryProtocol {
    private let remote: PSEDataSourceProtocol

    init(remote: PSEDataSourceProtocol) {
        self.remote = remote
    }

    func getStatus() async throws -> PSEStatus {
        try await remote.getStatus()
    }
}
