//
//  Flow.swift
//  iOS
//
//  Created by Mariusz Sut on 27/02/2022.
//

import SwiftUI
import Core

struct Flow: View {
    let viewModel: FlowViewModel

    var body: some View {
        HStack {
            HStack {
                Text(viewModel.name)
                    .font(.callout)
                Text(viewModel.value)
                    .font(.headline)
                    .foregroundColor(viewModel.tintColor)
            }
            Text(viewModel.literal)
                .foregroundColor(viewModel.tintColor)
        }
    }
}
