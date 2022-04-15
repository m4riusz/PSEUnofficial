//
//  ServiceResponseExtractor.swift
//  Core
//
//  Created by Mariusz Sut on 09/04/2022.
//

import Foundation

class MockServiceResponse {
    let path: String
    var fileNames: [String]

    init(path: String, fileNames: [String]) {
        self.path = path
        self.fileNames = fileNames
    }
}

struct MockServiceResponseExtractor {
    private struct Constants {
        static let serviceSeparator: Character = ","
        static let responseSeparator: Character = ":"
    }
    private let source: String?

    init(source: String?) {
        self.source = source
    }

    var extract: [MockServiceResponse] {
        guard let source = source else { return [] }
        var temporaryMap: [String: [String]] = [:]
        let services = source.split(separator: Constants.serviceSeparator).map { String($0) }
        let rows = services.map { $0.split(separator: Constants.responseSeparator).map { String($0) } }
        rows.forEach { row in
            if temporaryMap[row[0]] != nil {
                temporaryMap[row[0]]?.append(row[1])
            } else {
                temporaryMap[row[0]] = [row[1]]
            }
        }
        return temporaryMap.map { .init(path: $0.key, fileNames: $0.value) }
    }
}
