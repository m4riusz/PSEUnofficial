//
//  PowerStatusView.swift
//  iOS
//
//  Created by Mariusz Sut on 05/02/2022.
//

import SwiftUI

struct PowerStatusView: View {

    @StateObject var viewModel: PowerStatusViewModel

    var body: some View {
        VStack {
            switch viewModel.state {
            case .fetching(let data):
                LoadingView(viewModel: data)
            case .data(let data):
                FlowStatusView(viewModel: data)
            case .error(let data, let message):
                Text(message)
                    .foregroundColor(.red)
                if let data = data {
                    FlowStatusView(viewModel: data)
                }
            }
        }
        .refreshable { Task { await viewModel.getStatus() } }
        .onAppear { Task { await viewModel.getStatus() } }
    }
}
