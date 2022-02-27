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
            case .fetching:
                Text("Fetching data")
            case .data(data: let data):
                FlowStatusView(viewModel: data)
            case .error(message: let message):
                Text(message)
            }
        }
        .task {
            await viewModel.getStatus()
        }
    }
}
