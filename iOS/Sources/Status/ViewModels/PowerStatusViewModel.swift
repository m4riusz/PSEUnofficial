//
//  PSEPowerStatusViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 05/02/2022.
//

import Foundation
import Core

enum PowerStatusViewState {
    case fetching(data: LoadingViewModel)
    case data(data: PowerStatusDataViewModel)
    case error(lastData: PowerStatusDataViewModel?, message: String)

    var data: PowerStatusDataViewModel? {
        switch self {
        case .fetching: return nil
        case .data(let data): return data
        case .error(let data, _): return data
        }
    }
}

@MainActor
final class PowerStatusViewModel: ObservableObject {
    private typealias Summary = Assets.Strings.iOS.Summary
    private typealias CrossBorder = Assets.Strings.iOS.CrossBorder
    private typealias Images = Assets.Images.iOS.Energy
    private typealias Colors = Assets.Colors.iOS
    private struct Constants {
        static let frequencyFractionDigits = 3
    }

    @Published var state = PowerStatusViewState.fetching(data: .init())

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
        let result = await useCase.execute()
        switch result {
        case .success(let status):
            let formattedDate = status.date.formatted()
            state = .data(data: .init(formattedDate: formattedDate,
                                      flowViewModels: createFlowViewModels(flows: status.data.flows),
                                      crossBorderModels: createFlowCrossBorderModels(flows: status.data.flows),
                                      summaryViewModels: createSummaryViewModels(status: status)))
        case .failure(let error):
            state = .error(lastData: state.data, message: error.localizedDescription)
        }
    }

    private func createFlowViewModels(flows: [PSEFlow]) -> [FlowCountryRowViewModel] {
        flows.map { .init(country: $0.direction,
                          currentValue: $0.value,
                          plannedValue: $0.planned,
                          doubleFormatter: noFractionDigitsFormatter) }
    }

    private func createFlowCrossBorderModels(flows: [PSEFlow]) -> [FlowCrossBorderExchangeViewModel] {
        let parallel = flows.filter { $0.parallel }
        let nonParallel = flows.filter { !$0.parallel }
        let parallelCurrent = parallel.reduce(0.0, { $0 + $1.value })
        let parallelPlanned = parallel.reduce(0.0, { $0 + $1.planned })
        let nonParallelCurrent = nonParallel.reduce(0.0, { $0 + $1.value })
        let nonParallelPlanned = nonParallel.reduce(0.0, { $0 + $1.planned })

        return [.init(title: CrossBorder.parallelExchange,
                      current: parallelCurrent,
                      planned: parallelPlanned,
                      formatter: noFractionDigitsFormatter),
                .init(title: CrossBorder.nonParallelExchange,
                      current: nonParallelCurrent,
                      planned: nonParallelPlanned,
                      formatter: noFractionDigitsFormatter)
        ]
    }

    private func createSummaryViewModels(status: PSEStatus) -> [FlowSummaryRowViewModel] {
        let summary = status.data.summary
        let total = status.data.flows.reduce(0.0, { $0 + $1.value })
        return [
            .init(title: Summary.load,
                  rowType: .primary(value: summary.load, formatter: noFractionDigitsFormatter)),
            .init(title: Summary.generation,
                  rowType: .primary(value: summary.generation, formatter: noFractionDigitsFormatter)),
            .init(image: Images.thermal,
                  title: Summary.thermal,
                  rowType: .secondary(value: summary.thermal, formatter: noFractionDigitsFormatter)),
            .init(image: Images.water,
                  title: Summary.water,
                  rowType: .secondary(value: summary.water, formatter: noFractionDigitsFormatter)),
            .init(image: Images.wind,
                  title: Summary.wind,
                  rowType: .secondary(value: summary.wind, formatter: noFractionDigitsFormatter)),
            .init(image: Images.solar,
                  title: Summary.solar,
                  rowType: .secondary(value: summary.solar, formatter: noFractionDigitsFormatter)),
            .init(image: Images.other,
                  title: Summary.other,
                  rowType: .secondary(value: summary.other, formatter: noFractionDigitsFormatter)),
            .init(title: Summary.total,
                  rowType: .flow(value: .init(value: total, orientation: .vertical, formatter: noFractionDigitsFormatter))),
            .init(title: Summary.frequency,
                  rowType: .primary(value: summary.frequency, formatter: frequencyDoubleFormatter))
        ]
    }
}

struct PowerStatusDataViewModel {
    private typealias Literals = Assets.Strings.iOS.List
    let formattedDate: String
    let flowTitle = Literals.Section.flow
    let flowViewModels: [FlowCountryRowViewModel]
    let crossBorderTitle = Literals.Section.crossBorder
    let crossBorderModels: [FlowCrossBorderExchangeViewModel]
    let summaryTitle = Literals.Section.summary
    let summaryViewModels: [FlowSummaryRowViewModel]
}
