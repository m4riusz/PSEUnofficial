//
//  FlowSummaryRow.swift
//  iOS
//
//  Created by Mariusz Sut on 04/03/2022.
//

import SwiftUI
import Core

struct FlowSummaryRow: View {
    private typealias Colors = Assets.Colors.Core
    private struct Constants {
        static let imageSize = CGSize(width: 25, height: 25)
    }
    let viewModel: FlowSummaryRowViewModel

    var body: some View {
        HStack {
            if let image = viewModel.image {
                image
                    .resizable()
                    .frame(width: Constants.imageSize.width, height: Constants.imageSize.height)
            }
            Text(viewModel.title)
                .font(.callout)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Colors.textPrimary)
            switch viewModel.rowType {
            case .primary(let value, let formatter):
                Text(formatter.format(value: value))
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Colors.textPrimary)
            case .secondary(let value, let formatter):
                Text(formatter.format(value: value))
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Colors.textSecondary)
            case .flow(let value):
                FlowView(viewModel: value)
            }
        }
    }
}
