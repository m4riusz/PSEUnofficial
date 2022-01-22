//
//  PSERepository.swift
//  Core
//
//  Created by Mariusz Sut on 15/01/2022.
//

import Combine
import Foundation

public class PSERepository: PSERepositoryProtocol {
    private let service: PSERequestServiceProtocol

    public init(service: PSERequestServiceProtocol) {
        self.service = service
    }

    public func getStatus() -> AnyPublisher<PSEStatus, PSEError> {
        service.request(request: PSERequestStatus())
            .eraseToAnyPublisher()
    }
}
