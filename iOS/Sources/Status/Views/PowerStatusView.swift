//
//  PowerStatusView.swift
//  iOS
//
//  Created by Mariusz Sut on 05/02/2022.
//

import SwiftUI

struct PowerStatusView: View {
    private struct Constants {
        static let viewIdentifier = "PowerStatusViewIdentifier"
    }
    @StateObject var viewModel: PowerStatusViewModel

    var body: some View {
        VStack {
            switch viewModel.state {
            case .fetching(let data):
                LoadingView(viewModel: data)
            case .data(let data):
                FlowStatusView(viewModel: data)
            case .error(let data):
                ErrorView(viewModel: data)
            }
        }
        .refreshable { await viewModel.getStatus() }
        .onAppear { Task { await viewModel.getStatus() } }
        .accessibilityIdentifier(Constants.viewIdentifier)
    }
}
