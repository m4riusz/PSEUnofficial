//
//  FlowSummaryRowViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 04/03/2022.
//

import Core
import SwiftUI

struct FlowSummaryRowViewModel {
    enum FlowSummaryRowType {
        case primary(value: Double, formatter: DoubleValueFormatter)
        case secondary(value: Double, formatter: DoubleValueFormatter)
        case flow(value: FlowViewModel)
    }
    let image: Image?
    let title: String
    let rowType: FlowSummaryRowType

    init(image: Image? = nil,
         title: String,
         rowType: FlowSummaryRowType) {
        self.image = image
        self.title = title
        self.rowType = rowType
    }
}
