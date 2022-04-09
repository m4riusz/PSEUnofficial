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
    let additionalServiceResponses: [ServiceResponse]

    public init(enviroment: [String: String]) {
        isRunningUITest = Bool(enviroment[Constants.isRuningUITest] ?? "") ?? false
        additionalServiceResponses = ServiceResponseExtractor(source: enviroment[Constants.aditionalServiceResponses]).extract
    }
}
