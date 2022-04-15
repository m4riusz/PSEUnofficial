//
//  MockURLProtocol.swift
//  Core
//
//  Created by Mariusz Sut on 14/04/2022.
//

import Foundation

final class MockURLProtocol: URLProtocol {
    private struct Constants {
        static let json = "json"
        static let errorSuffix = "_error"
        static let errorCode = 404
        static let successCode = 200
    }
    static var mockedServices: [MockServiceResponse] = []
    static var bundle: Bundle?

    override class func canInit(with request: URLRequest) -> Bool {
        true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        guard let bundle = MockURLProtocol.bundle,
              let url = request.url,
              let mock = getMockedDataForUrl(url: url, bundle: bundle) else {
                  client?.urlProtocol(self, didFailWithError: NSError(message: "Response file not found"))
                  return
              }
        let response = HTTPURLResponse(url: url, statusCode: mock.responseCode, httpVersion: nil, headerFields: nil)!
        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        client?.urlProtocol(self, didLoad: mock.data)
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() { /*NOP*/ }

    private func getMockedDataForUrl(url: URL, bundle: Bundle) -> MockedResponseData? {
        guard let service = findMatchingMockedService(url: url), !service.fileNames.isEmpty else {
            return nil
        }
        let firstFileName = service.fileNames.removeFirst()
        guard let responsePath = findFilePath(fileName: firstFileName, bundle: bundle),
        let data = try? Data(contentsOf: responsePath)else {
            return nil
        }
        return .init(data: data, responseCode: responseCodeForFileName(fileName: firstFileName))
    }

    private func findMatchingMockedService(url: URL) -> MockServiceResponse? {
        MockURLProtocol.mockedServices.first(where: { "/\($0.path)" == url.path })
    }

    private func findFilePath(fileName: String, bundle: Bundle) -> URL? {
        bundle.url(forResource: fileName, withExtension: Constants.json)
    }

    private func responseCodeForFileName(fileName: String) -> Int {
        fileName.contains(Constants.errorSuffix) ? Constants.errorCode : Constants.successCode
    }
}

private struct MockedResponseData {
    let data: Data
    let responseCode: Int
}
