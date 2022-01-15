//
//  PSERepository.swift
//  Core
//
//  Created by Mariusz Sut on 15/01/2022.
//

import Foundation

public class PSERepository: PSERepositoryProtocol {

    public init() { /*Nop*/ }
    
    public func getStatus() async throws -> PSEStatus {
        let url = URL(string: "https://www.pse.pl/transmissionMapService")!
        let rawData = try await URLSession.shared.data(from: url).0
        return try JSONDecoder().decode(PSEStatus.self, from: rawData)
    }
}
