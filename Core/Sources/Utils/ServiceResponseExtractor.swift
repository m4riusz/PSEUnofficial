//
//  ServiceResponseExtractor.swift
//  Core
//
//  Created by Mariusz Sut on 09/04/2022.
//

import Foundation

public struct ServiceResponse {
    let serviceName: String
    let fileNames: [String]
}

struct ServiceResponseExtractor {
    private struct Constants {
        static let serviceSeparator: Character = ","
        static let responseSeparator: Character = ":"
    }
    private let source: String?

    init(source: String?) {
        self.source = source
    }

    var extract: [ServiceResponse] {
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
        return temporaryMap.map { .init(serviceName: $0.key, fileNames: $0.value) }
    }
}
