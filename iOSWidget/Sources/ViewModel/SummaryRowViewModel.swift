//
//  SummaryRowViewModel.swift
//  iOSWidget
//
//  Created by Mariusz Sut on 17/08/2022.
//

import SwiftUI
import Core

struct SummaryRowViewModel {
    enum RowType {
        case primary(value: Double, formatter: DoubleValueFormatter)
        case secondary(value: Double, formatter: DoubleValueFormatter)
        case flow(value: FlowViewModel)
    }
    let image: Image?
    let title: String
    let rowType: RowType

    init(image: Image? = nil,
         title: String,
         rowType: RowType) {
        self.image = image
        self.title = title
        self.rowType = rowType
    }
}
