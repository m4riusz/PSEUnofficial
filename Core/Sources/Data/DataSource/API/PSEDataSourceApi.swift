//
//  PSEDataSourceApi.swift
//  Core
//
//  Created by Mariusz Sut on 29/01/2022.
//

import Foundation

final class PSEDataSourceApi: PSEDataSourceProtocol {
    private let service: PSERequestServiceProtocol

    init(service: PSERequestServiceProtocol) {
        self.service = service
    }

    func getStatus() async throws -> PSEStatus {
        try await service.request(request: PSERequestStatus()).asDomain
    }
}
