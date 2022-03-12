//
//  FlowCountryRowViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import Core

struct FlowCountryRowViewModel {
    private typealias Literals = Assets.Strings.Core.Common
    private let currentValue: Double
    private let plannedValue: Double
    private let doubleFormatter: DoubleValueFormatter
    let current = Literals.current
    let planned = Literals.planned
    let country: PSEDirection

    var currentViewModel: FlowViewModel {
        .init(value: currentValue, orientation: .horizontal, formatter: doubleFormatter)
    }

    var plannedViewModel: FlowViewModel {
        .init(value: plannedValue, orientation: .horizontal, formatter: doubleFormatter)
    }

    init(country: PSEDirection,
         currentValue: Double,
         plannedValue: Double,
         doubleFormatter: DoubleValueFormatter) {
        self.country = country
        self.currentValue = currentValue
        self.plannedValue = plannedValue
        self.doubleFormatter = doubleFormatter
    }
}
