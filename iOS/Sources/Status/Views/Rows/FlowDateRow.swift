//
//  FlowDateRow.swift
//  iOS
//
//  Created by Mariusz Sut on 18/03/2022.
//

import SwiftUI
import Core

struct FlowDateRow: View {
    private typealias Colors = Assets.Colors.iOS
    let viewModel: FlowDateRowViewModel

    var body: some View {
        Text(viewModel.formattedDate).font(.footnote)
            .fontWeight(viewModel.freshData ? .light : .semibold)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .foregroundColor(viewModel.freshData ? Colors.textSecondary : Colors.warning)
    }
}
