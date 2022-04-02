//
//  PSERepositoryProtocolMock.swift
//  Core
//
//  Created by Mariusz Sut on 02/04/2022.
//

import Foundation

@testable import Core

final class PSERepositoryProtocolMock: PSERepositoryProtocol {

    var getStatusResult: Result<PSEStatus, Error>!

    func getStatus() async throws -> PSEStatus {
        switch getStatusResult! {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
}
