//
//  FlowView.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import SwiftUI

public struct FlowView: View {
    private typealias Colors = Assets.Colors.Core
    let viewModel: FlowViewModel

    public init(viewModel: FlowViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        switch viewModel.orientation {
        case .vertical:
            verticalView
                .foregroundColor(viewModel.flowType.tintColor)
        case .horizontal:
            horizontalView
                .foregroundColor(viewModel.flowType.tintColor)
        }
    }

    private var verticalView: some View {
        VStack(alignment: .trailing, spacing: 0) {
            Text(viewModel.formatedValue)
                .font(.title2)
                .fontWeight(.medium)
            if !viewModel.literal.isEmpty {
                Text(viewModel.literal)
                    .font(.caption)
            }
        }
    }

    private var horizontalView: some View {
        switch viewModel.flowType {
        case .export, .import:
            return Text(viewModel.formatedValue).font(.title2).fontWeight(.medium) + Text(" ") + Text(viewModel.literal).font(.caption)
        case .none:
            return Text(viewModel.formatedValue).font(.title2).fontWeight(.medium)
        }
    }
}
