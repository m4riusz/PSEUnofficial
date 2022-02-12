//
//  PSEPowerStatusView.swift
//  iOS
//
//  Created by Mariusz Sut on 05/02/2022.
//

import SwiftUI

struct PSEPowerStatusView: View {

    @StateObject var viewModel: PSEPowerStatusViewModel

    var body: some View {
        VStack {
            switch viewModel.state {
            case .fetching:
                Text("Fetching data")
            case .data(data: let data):
                PSEStatusView(status: data)
            case .error(message: let message):
                Text(message)
            }
        }
        .task {
            await viewModel.getStatus()
        }
    }
}
