//
//  PSERequestServiceProtocol.swift
//  Core
//
//  Created by Mariusz Sut on 22/01/2022.
//

import Foundation
import Combine

protocol PSERequestServiceProtocol {
    func request<Request: PSEAbstractRequest>(request: Request) async throws -> Request.Response
}

final class PSERequestService: PSERequestServiceProtocol {
    private let baseUrl: String
    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder

    init(baseUrl: String, jsonDecoder: JSONDecoder, urlSession: URLSession) {
        self.baseUrl = baseUrl
        self.jsonDecoder = jsonDecoder
        self.urlSession = urlSession
    }

    func request<Request>(request: Request) async throws -> Request.Response where Request: PSEAbstractRequest {
        guard var components = URLComponents(string: "\(baseUrl)\(request.path)") else {
            throw PSEApiError.invalidRequest
        }
        if request.queryItems.count > 0 {
            components.queryItems = request.queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        guard let url = components.url else {
            throw PSEApiError.invalidRequest
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers

        guard let (data, response) = try? await urlSession.data(for: urlRequest) else {
            throw PSEApiError.invalidRequest
        }

        guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
            throw PSEApiError.statusNotOK
        }

        guard let result = try? request.decode(decoder: jsonDecoder, data: data) else {
            throw PSEApiError.invalidDataFormat
        }

        return result
    }
}
