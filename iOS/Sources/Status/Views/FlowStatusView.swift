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
        Text(viewModel.formattedDate)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.caption)
        List {
            Section(viewModel.flowTitle) {
                ForEach(viewModel.flowViewModels, id: \.country) { rowViewModel in
                    FlowCountryRow(viewModel: rowViewModel)
                }
            }
            Section(viewModel.summaryTitle) {
                ForEach(viewModel.summaryViewModels, id: \.title) { rowViewModel in
                    FlowSummaryRow(viewModel: rowViewModel)
                }
            }
        }
        .listStyle(.plain)
    }
}
