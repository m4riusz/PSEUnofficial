//
//  FlowSummaryRow.swift
//  iOS
//
//  Created by Mariusz Sut on 04/03/2022.
//

import SwiftUI
import Core

struct FlowSummaryRow: View {
    private typealias Colors = Assets.Colors.iOS
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
            VStack(spacing: 0) {
                Text(viewModel.value)
                    .font(.title2)
                    .fontWeight(.medium)
                if let valueDetail = viewModel.valueDetail {
                    Text(valueDetail)
                        .font(.caption)
                }
            }
            .foregroundColor(viewModel.valueColor)
        }
    }
}
