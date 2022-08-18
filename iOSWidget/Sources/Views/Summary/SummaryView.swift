//
//  SummaryView.swift
//  iOSWidget
//
//  Created by Mariusz Sut on 17/08/2022.
//

import SwiftUI

struct SummaryView: View {
    private struct Constants {
        static let rowHeight: CGFloat = 25
        static let padding: CGFloat = 5
    }
    let viewModel: SummaryViewModel

    var body: some View {
        ForEach(viewModel.cells, id: \.title) { rowViewModel in
            SummaryRow(viewModel: rowViewModel)
                .frame(maxWidth: .infinity, minHeight: Constants.rowHeight, maxHeight: Constants.rowHeight, alignment: .leading)
        }
        .padding(Constants.padding)
    }
}
