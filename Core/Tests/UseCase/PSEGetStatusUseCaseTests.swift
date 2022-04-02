//
//  PSEGetStatusUseCaseTests.swift
//  Core
//
//  Created by Mariusz Sut on 02/04/2022.
//

import XCTest

@testable import Core

final class PSEGetStatusUseCaseTests: XCTestCase {

    private let repository = PSERepositoryProtocolMock()
    private lazy var sut = PSEGetStatusUseCase(repository: repository)

    func testSuccess() async throws {
        let mockData = PSEStatus.mock
        repository.getStatusResult = .success(mockData)
        let result = await sut.execute()
        XCTAssertEqual(result, .success(mockData))
    }

    func testFailureUnknownError() async throws {
        repository.getStatusResult = .failure(NSError(domain: "", code: 1, userInfo: [:]))
        let result = await sut.execute()
        XCTAssertEqual(result, .failure(.networkError))
    }

    func testFailureStatusNotOk() async throws {
        repository.getStatusResult = .failure(PSEApiError.statusNotOK)
        let result = await sut.execute()
        XCTAssertEqual(result, .failure(.internal))
    }

    func testFailureInvalidDataFormat() async throws {
        repository.getStatusResult = .failure(PSEApiError.invalidDataFormat)
        let result = await sut.execute()
        XCTAssertEqual(result, .failure(.internal))
    }

    func testFailureInvalidRequest() async throws {
        repository.getStatusResult = .failure(PSEApiError.invalidRequest)
        let result = await sut.execute()
        XCTAssertEqual(result, .failure(.internal))
    }
}

extension PSEStatus {
    static var mock: PSEStatus {
        .init(status: "status",
              date: .now,
              data: .init(flows: [ .init(direction: .czech,
                                         value: 10,
                                         parallel: true,
                                         planned: 20)],
                          summary: .init(water: 1,
                                         wind: 2,
                                         solar: 3,
                                         thermal: 4,
                                         other: 5,
                                         frequency: 6,
                                         load: 7,
                                         generation: 8)))
    }
}
