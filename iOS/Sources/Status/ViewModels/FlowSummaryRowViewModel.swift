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
         valueFractionDigits: Int = 0,
         valueColor: Color = Assets.Colors.iOS.textPrimary) {
        self.image = image
        self.title = title
        self.value = DoubleFormatter().string(value: value,
                                              minimumFractionDigits: valueFractionDigits,
                                              maximumFractionDigits: valueFractionDigits)
        self.valueColor = valueColor
    }
}
