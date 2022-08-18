//
//  SummaryViewModel.swift
//  iOSWidget
//
//  Created by Mariusz Sut on 17/08/2022.
//

import Foundation
import Core

struct SummaryViewModel {
    private typealias Summary = Assets.Strings.Core.Summary
    private typealias Images = Assets.Images.Core.Energy

    private let noFractionDigitsFormatter: DoubleValueFormatter
    private let frequencyDoubleFormatter: DoubleValueFormatter
    private let status: PSEStatus

    init(noFractionDigitsFormatter: DoubleValueFormatter,
         frequencyDoubleFormatter: DoubleValueFormatter,
         status: PSEStatus) {
        self.noFractionDigitsFormatter = noFractionDigitsFormatter
        self.frequencyDoubleFormatter = frequencyDoubleFormatter
        self.status = status
    }

    var cells: [SummaryRowViewModel] {
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
