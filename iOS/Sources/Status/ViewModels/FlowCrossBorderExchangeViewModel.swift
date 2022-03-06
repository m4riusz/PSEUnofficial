//
//  FlowCrossBorderExchangeViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 06/03/2022.
//

import Foundation
import Core

struct FlowCrossBorderExchangeViewModel {
    let title: String
    let current: String
    let currentState: FlowState
    let planned: String
    let plannedState: FlowState
    
    init(title: String, current: Double, planned: Double) {
        self.title = title
        self.current = DoubleFormatter().string(value: current)
        self.planned = DoubleFormatter().string(value: planned)
        currentState = FlowState(value: current)
        plannedState = FlowState(value: planned)
    }
}
