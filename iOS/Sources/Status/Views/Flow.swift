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
            Text(viewModel.name)
                .font(.callout)
            formattedText
                .foregroundColor(viewModel.tintColor)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }

    private var formattedText: Text {
        Text(viewModel.value).font(.title2).fontWeight(.medium) + Text(" ") + Text(viewModel.literal).font(.caption)
    }
}
