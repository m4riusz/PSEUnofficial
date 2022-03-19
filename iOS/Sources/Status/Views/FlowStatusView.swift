//
//  FlowStatusView.swift
//  iOS
//
//  Created by Mariusz Sut on 05/02/2022.
//

import SwiftUI
import Core

struct FlowStatusView: View {
    let viewModel: PowerStatusDataViewModel

    var body: some View {
        Text("")
            .frame(maxWidth: .infinity, minHeight: 1, maxHeight: 1)
        List {
            Section(viewModel.flowTitle) {
                ForEach(viewModel.flowViewModels, id: \.country) { rowViewModel in
                    FlowCountryRow(viewModel: rowViewModel)
                }
            }
            Section(viewModel.crossBorderTitle) {
                ForEach(viewModel.crossBorderModels, id: \.title) { rowViewModel in
                    FlowCrossBorderExchangeRow(viewModel: rowViewModel)
                }
            }
            Section(viewModel.summaryTitle) {
                ForEach(viewModel.summaryViewModels, id: \.title) { rowViewModel in
                    FlowSummaryRow(viewModel: rowViewModel)
                }
            }
            FlowDateRow(viewModel: viewModel.dateViewModel)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}
