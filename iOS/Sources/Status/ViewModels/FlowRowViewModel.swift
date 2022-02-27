//
//  FlowRowViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import Core

struct FlowRowViewModel {
    private typealias Literals = Assets.Strings.Core.Common
    private let currentValue: Double
    private let plannedValue: Double
    let country: PSEDirection

    var currentViewModel: FlowViewModel {
        .init(name: Literals.current, value: currentValue)
    }

    var plannedViewModel: FlowViewModel {
        .init(name: Literals.planned, value: plannedValue)
    }

    init(country: PSEDirection, currentValue: Double, plannedValue: Double) {
        self.country = country
        self.currentValue = currentValue
        self.plannedValue = plannedValue
    }
}
