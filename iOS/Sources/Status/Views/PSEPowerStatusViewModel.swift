//
//  PSEPowerStatusViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 05/02/2022.
//

import Foundation
import Core

enum PSEPowerStatusState {
    case fetching
    case data(data: PSEStatus)
    case error(message: String)
}

@MainActor
final class PSEPowerStatusViewModel: ObservableObject {
    @Published var state = PSEPowerStatusState.fetching

    let useCase: GetStatusUseCaseProtocol

    nonisolated init(useCase: GetStatusUseCaseProtocol) {
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
