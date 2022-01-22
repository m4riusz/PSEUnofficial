//
//  PSERepositoryProtocol.swift
//  Core
//
//  Created by Mariusz Sut on 15/01/2022.
//

import Foundation
import Combine

public protocol PSERepositoryProtocol {
    func getStatus() -> AnyPublisher<PSEStatus, PSEError>
}
