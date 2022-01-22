//
//  PSEAbstractRequest.swift
//  Core
//
//  Created by Mariusz Sut on 22/01/2022.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public protocol PSEAbstractRequest {
    associatedtype Response

    var serviceName: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var queryItems: [String: String] { get }

    func decode(decoder: JSONDecoder, data: Data) throws -> Response
}

public extension PSEAbstractRequest {
    var headers: [String: String] { [:] }
    var queryItems: [String: String] { [:] }
}

// MARK: - Decodable
public extension PSEAbstractRequest where Response: Decodable {
    func decode(decoder: JSONDecoder, data: Data) throws -> Response {
        try decoder.decode(Response.self, from: data)
    }
}
