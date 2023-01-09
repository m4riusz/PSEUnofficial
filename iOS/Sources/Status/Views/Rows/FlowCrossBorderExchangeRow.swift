//
//  FlowCrossBorderExchangeRow.swift
//  iOS
//
//  Created by Mariusz Sut on 06/03/2022.
//

import Core
import SwiftUI

struct FlowCrossBorderExchangeRow: View {
    private struct Constants {
        static let spacing: CGFloat = 8
    }
    private typealias Colors = Assets.Colors.Core
    let viewModel: FlowCrossBorderExchangeViewModel

    var body: some View {
        VStack(spacing: Constants.spacing) {
            Text(viewModel.title)
                .font(.callout)
                .foregroundColor(Colors.textPrimary)
                .multilineTextAlignment(.center)
            HStack(spacing: Constants.spacing) {
                VStack(alignment: .trailing) {
                    Text(viewModel.currentLiteral)
                        .font(.callout)
                        .foregroundColor(viewModel.current.flowType.tintColor)
                    FlowView(viewModel: viewModel.current)
                }
                VStack(alignment: .trailing) {
                    Text(viewModel.plannedLiteral)
                        .font(.callout)
                        .foregroundColor(viewModel.planned.flowType.tintColor)
                    FlowView(viewModel: viewModel.planned)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}
