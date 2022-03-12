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

    private let noFractionDigitsFormatter: DoubleValueFormatter
    private let frequencyDoubleFormatter: DoubleValueFormatter
    let useCase: PSEGetStatusUseCaseProtocol

    nonisolated init(useCase: PSEGetStatusUseCaseProtocol,
                     noFractionDigitsFormatter: DoubleValueFormatter,
                     frequencyDoubleFormatter: DoubleValueFormatter) {
        self.useCase = useCase
        self.noFractionDigitsFormatter = noFractionDigitsFormatter
        self.frequencyDoubleFormatter = frequencyDoubleFormatter
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
        flows.map { .init(country: $0.direction,
                          currentValue: $0.value,
                          plannedValue: $0.planned,
                          doubleFormatter: noFractionDigitsFormatter) }
    }

    private func createSummaryViewModels(status: PSEStatus) -> [FlowSummaryRowViewModel] {
        let summary = status.data.summary
        let total = status.data.flows.reduce(0.0, { $0 + $1.value })
        return [
            .init(title: Literals.load,
                  rowType: .primary(value: summary.load, formatter: noFractionDigitsFormatter)),
            .init(title: Literals.generation,
                  rowType: .primary(value: summary.generation, formatter: noFractionDigitsFormatter)),
            .init(image: Images.thermal,
                  title: Literals.thermal,
                  rowType: .secondary(value: summary.thermal, formatter: noFractionDigitsFormatter)),
            .init(image: Images.water,
                  title: Literals.water,
                  rowType: .secondary(value: summary.water, formatter: noFractionDigitsFormatter)),
            .init(image: Images.wind,
                  title: Literals.wind,
                  rowType: .secondary(value: summary.wind, formatter: noFractionDigitsFormatter)),
            .init(image: Images.solar,
                  title: Literals.solar,
                  rowType: .secondary(value: summary.solar, formatter: noFractionDigitsFormatter)),
            .init(image: Images.other,
                  title: Literals.other,
                  rowType: .secondary(value: summary.other, formatter: noFractionDigitsFormatter)),
            .init(title: Literals.total,
                  rowType: .flow(value: .init(value: total, orientation: .vertical, formatter: noFractionDigitsFormatter))),
            .init(title: Literals.frequency,
                  rowType: .primary(value: summary.frequency, formatter: frequencyDoubleFormatter))
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
