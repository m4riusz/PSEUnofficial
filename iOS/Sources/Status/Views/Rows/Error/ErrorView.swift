//
//  ErrorView.swift
//  iOS
//
//  Created by Mariusz Sut on 13/03/2022.
//

import SwiftUI
import Core

struct ErrorView: View {
    private typealias Colors = Assets.Colors.iOS
    let viewModel: ErrorViewModel

    var body: some View {
        Text(viewModel.errorMessage)
            .font(.headline)
            .foregroundColor(Colors.warning)
            .multilineTextAlignment(.center)

    }
}
