//
//  GetStatus.swift
//  Core
//
//  Created by Mariusz Sut on 29/01/2022.
//

import Foundation

public enum UseCaseError: Error {
    case `internal`
    case networkError
}

public protocol GetStatus {
    func execute() async -> Result<PSEStatus, UseCaseError>
}

final class GetStatusUseCase: GetStatus {
    private let repository: PSERepositoryProtocol

    init(repository: PSERepositoryProtocol) {
        self.repository = repository
    }

    func execute() async -> Result<PSEStatus, UseCaseError> {
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
