//
//  FlowCrossBorderExchangeViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 06/03/2022.
//

import Core

struct FlowCrossBorderExchangeViewModel {
    private typealias Literals = Assets.Strings.Core.Common
    let title: String
    let currentLiteral = Literals.current
    let current: FlowViewModel
    let plannedLiteral = Literals.planned
    let planned: FlowViewModel

    init(title: String, current: Double, planned: Double, formatter: DoubleValueFormatter) {
        self.title = title
        self.current = FlowViewModel(value: current, orientation: .vertical, formatter: formatter)
        self.planned = FlowViewModel(value: planned, orientation: .vertical, formatter: formatter)
    }
}
