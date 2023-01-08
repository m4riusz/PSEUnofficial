//
//  SummaryView.swift
//  iOSWidget
//
//  Created by Mariusz Sut on 17/08/2022.
//

import SwiftUI

struct SummaryView: View {
    private struct Constants {
        static let padding: CGFloat = 5
    }
    let viewModel: SummaryViewModel

    var body: some View {
        VStack {
            ForEach(viewModel.cells, id: \.title) { rowViewModel in
                SummaryRow(viewModel: rowViewModel)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(Constants.padding)
    }
}
