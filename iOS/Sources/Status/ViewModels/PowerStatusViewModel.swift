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
    case data(data: PowerStatusDataViewModel)
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
        case .success(let status):
            let formattedDate = status.date.formatted()
            let flows = status.data.flows.map { FlowRowViewModel(country: $0.direction,
                                                                 currentValue: $0.value,
                                                                 plannedValue: $0.planned) }
            state = .data(data: .init(formattedDate: formattedDate, flowViewModels: flows))
        case .failure(let error):
            state = .error(message: error.localizedDescription)
        }
    }
}

struct PowerStatusDataViewModel {
    private typealias Literals = Assets.Strings.iOS.List
    let formattedDate: String
    let flowTitle = Literals.Section.flow
    let flowViewModels: [FlowRowViewModel]
}
