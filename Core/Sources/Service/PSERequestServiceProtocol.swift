//
//  PSERequestServiceProtocol.swift
//  Core
//
//  Created by Mariusz Sut on 22/01/2022.
//

import Foundation
import Combine

public protocol PSERequestServiceProtocol {
    func request<Request: PSEAbstractRequest>(request: Request) -> Future<Request.Response, PSEError>
}

final public class PSERequestService: PSERequestServiceProtocol {
    private let baseUrl: String
    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder

    public init(baseUrl: String, jsonDecoder: JSONDecoder, urlSession: URLSession) {
        self.baseUrl = baseUrl
        self.jsonDecoder = jsonDecoder
        self.urlSession = urlSession
    }

    public func request<Request>(request: Request) -> Future<Request.Response, PSEError> where Request: PSEAbstractRequest {
        Future { [weak self] promise in
            guard let strongSelf = self else {
                promise(.failure(.internal))
                return
            }
            guard var components = URLComponents(string: "\(strongSelf.baseUrl)/\(request.path)") else {
                promise(.failure(.invalidRequest))
                return
            }
            components.queryItems = request.queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
            guard let url = components.url else {
                promise(.failure(.invalidRequest))
                return
            }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = request.method.rawValue
            urlRequest.allHTTPHeaderFields = request.headers

            strongSelf.urlSession.dataTask(with: urlRequest) { data, response, error in
                if error != nil {
                    promise(.failure(.internal))
                }
                guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                    return promise(.failure(.invalidRequest))
                }
                guard let data = data else {
                    return promise(.failure(.noData))
                }
                do {
                    try promise(.success(request.decode(decoder: strongSelf.jsonDecoder, data: data)))
                } catch {
                    promise(.failure(.invalidFormat))
                }
            }
            .resume()
        }
    }
}
