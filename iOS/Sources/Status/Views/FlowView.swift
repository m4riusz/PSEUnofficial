//
//  FlowView.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import SwiftUI
import Core

struct FlowView: View {
    private typealias Colors = Assets.Colors.iOS
    let viewModel: FlowViewModel

    var body: some View {
        switch viewModel.orientation {
        case .vertical:
            verticalView
                .foregroundColor(viewModel.tintColor)
        case .horizontal:
            horizontalView
                .foregroundColor(viewModel.tintColor)
        }
    }

    private var verticalView: some View {
        VStack(spacing: 0) {
            Text(viewModel.formatedValue)
                .font(.title2)
                .fontWeight(.medium)
            Text(viewModel.literal)
                .font(.caption)
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

extension FlowViewModel {
    var tintColor: Color {
        typealias Colors = Assets.Colors.iOS
        switch flowType {
        case .export: return Colors.exportTintColor
        case .import: return Colors.importTintColor
        case .none: return Colors.noneTintColor
        }
    }
}
