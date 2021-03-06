//
//  LaunchEnvironment.swift
//  Core
//
//  Created by Mariusz Sut on 09/04/2022.
//

public struct LaunchEnvironment {
    private struct Constants {
        static let isRuningUITest = "isRuningUITest"
        static let aditionalServiceResponses = "aditionalServiceResponses"
    }
    let isRunningUITest: Bool
    let additionalServiceResponses: [MockServiceResponse]

    public init(enviroment: [String: String]) {
        isRunningUITest = Bool(enviroment[Constants.isRuningUITest] ?? "") ?? false
        additionalServiceResponses = MockServiceResponseExtractor(source: enviroment[Constants.aditionalServiceResponses]).extract
    }
}
