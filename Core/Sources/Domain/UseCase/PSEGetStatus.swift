//
//  PSEGetStatus.swift
//  Core
//
//  Created by Mariusz Sut on 29/01/2022.
//

import Foundation

public enum PSEGetStatusUseCaseError: Error {
    case `internal`
    case networkError
}

public protocol PSEGetStatusUseCaseProtocol {
    func execute() async -> Result<PSEStatus, PSEGetStatusUseCaseError>
}

final class PSEGetStatusUseCase: PSEGetStatusUseCaseProtocol {
    private let repository: PSERepositoryProtocol

    init(repository: PSERepositoryProtocol) {
        self.repository = repository
    }

    func execute() async -> Result<PSEStatus, PSEGetStatusUseCaseError> {
        do {
            return try await .success(repository.getStatus())
        } catch let(error) {
            switch error {
            case PSEApiError.statusNotOK, PSEApiError.invalidRequest, PSEApiError.invalidDataFormat:
                return .failure(.networkError)
            default:
                return .failure(.internal)
            }
        }
    }
}
