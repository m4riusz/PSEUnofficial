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
    private typealias Literals = Assets.Strings.iOS.Summary
    private typealias Images = Assets.Images.iOS.Energy
    private typealias Colors = Assets.Colors.iOS
    private struct Constants {
        static let frequencyFractionDigits = 3
    }

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
            state = .data(data: .init(formattedDate: formattedDate,
                                      flowViewModels: createFlowViewModels(flows: status.data.flows),
                                      summaryViewModels: createSummaryViewModels(status: status)))
        case .failure(let error):
            state = .error(message: error.localizedDescription)
        }
    }

    private func createFlowViewModels(flows: [PSEFlow]) -> [FlowRowViewModel] {
        flows.map { .init(country: $0.direction, currentValue: $0.value, plannedValue: $0.planned) }
    }

    private func createSummaryViewModels(status: PSEStatus) -> [FlowSummaryRowViewModel] {
        let summary = status.data.summary
        let total = status.data.flows.reduce(0.0, { $0 + $1.value })
        let totalState = FlowState(value: total)
        return [
            .init(title: Literals.load, value: summary.load),
            .init(title: Literals.generation, value: summary.generation),
            .init(image: Images.thermal, title: Literals.thermal, value: summary.thermal, valueColor: Colors.textSecondary),
            .init(image: Images.water, title: Literals.water, value: summary.water, valueColor: Colors.textSecondary),
            .init(image: Images.wind, title: Literals.wind, value: summary.wind, valueColor: Colors.textSecondary),
            .init(image: Images.solar, title: Literals.solar, value: summary.solar, valueColor: Colors.textSecondary),
            .init(image: Images.other, title: Literals.other, value: summary.other, valueColor: Colors.textSecondary),
            .init(title: Literals.total, value: total, valueDetail: totalState.literal, valueColor: totalState.tintColor),
            .init(title: Literals.frequency, value: summary.frequency, valueFractionDigits: Constants.frequencyFractionDigits)
        ]
    }
}

struct PowerStatusDataViewModel {
    private typealias Literals = Assets.Strings.iOS.List
    let formattedDate: String
    let flowTitle = Literals.Section.flow
    let flowViewModels: [FlowRowViewModel]
    let summaryTitle = Literals.Section.summary
    let summaryViewModels: [FlowSummaryRowViewModel]
}
