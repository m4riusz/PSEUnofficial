//
//  PSEPowerStatusViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 05/02/2022.
//

import Foundation
import Core

enum PowerStatusState {
    case fetching
    case data(data: PSEStatus)
    case error(message: String)
}

@MainActor
final class PowerStatusViewModel: ObservableObject {
    @Published var state = PowerStatusState.fetching

    let useCase: PSEGetStatusUseCaseProtocol

    nonisolated init(useCase: PSEGetStatusUseCaseProtocol) {
        self.useCase = useCase
    }

    func getStatus() async {
        state = .fetching
        let result = await useCase.execute()
        switch result {
        case .success(let data):
            state = .data(data: data)
        case .failure(let error):
            state = .error(message: error.localizedDescription)
        }
    }

}
