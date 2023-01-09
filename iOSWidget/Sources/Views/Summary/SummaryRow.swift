//
//  SummaryRow.swift
//  iOSWidget
//
//  Created by Mariusz Sut on 17/08/2022.
//

import SwiftUI
import Core

struct SummaryRow: View {
    private typealias Colors = Assets.Colors.Core
    private struct Constants {
        static let imageSize = CGSize(width: 20, height: 20)
    }
    let viewModel: SummaryRowViewModel

    var body: some View {
        HStack {
            if let image = viewModel.image {
                image
                    .resizable()
                    .frame(width: Constants.imageSize.width, height: Constants.imageSize.height)
            }
            Text(viewModel.title)
                .font(viewModel.rowType.fontType)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Colors.textPrimary)
            switch viewModel.rowType {
            case .primary(let value, let formatter):
                Text(formatter.format(value: value))
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(Colors.textPrimary)
            case .secondary(let value, let formatter):
                Text(formatter.format(value: value))
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(Colors.textSecondary)
            case .flow(let value):
                FlowView(viewModel: value)
            }
        }
    }
}

private extension SummaryRowViewModel.RowType {
    var fontType: Font {
        switch self {
        case .primary, .flow: return .headline
        default: return .subheadline
        }
    }
}
