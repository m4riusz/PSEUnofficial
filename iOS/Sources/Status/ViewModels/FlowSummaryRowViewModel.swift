//
//  FlowSummaryRowViewModel.swift
//  iOS
//
//  Created by Mariusz Sut on 04/03/2022.
//

import Core
import SwiftUI

struct FlowSummaryRowViewModel {
    let image: Image?
    let title: String
    let value: String
    let valueColor: Color

    init(image: Image? = nil,
         title: String,
         value: Double,
         valueColor: Color = Assets.Colors.iOS.textPrimary,
         formatter: DoubleValueFormatter) {
        self.image = image
        self.title = title
        self.value = formatter.format(value: value)
        self.valueColor = valueColor
    }
}
