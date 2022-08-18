//
//  ErrorView.swift
//  iOSWidget
//
//  Created by Mariusz Sut on 18/08/2022.
//

import SwiftUI
import Core

struct ErrorView: View {
    private typealias Colors = Assets.Colors.Core
    let viewModel: ErrorViewModel

    var body: some View {
        Text(viewModel.errorLiteral)
            .font(.title2)
            .foregroundColor(Colors.textSecondary)
            .multilineTextAlignment(.center)
            .padding()
    }
}
