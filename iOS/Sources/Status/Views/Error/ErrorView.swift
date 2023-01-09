//
//  ErrorView.swift
//  iOS
//
//  Created by Mariusz Sut on 13/03/2022.
//

import SwiftUI
import Core

struct ErrorView: View {
    private struct Constants {
        static let imageSize = CGSize(width: 95, height: 95)
        static let smallSpacing: CGFloat = 4
        static let bigSpasing: CGFloat = 16
    }
    private typealias Colors = Assets.Colors.Core
    private typealias Images = Assets.Images.iOS
    let viewModel: ErrorViewModel

    var body: some View {
        VStack {
            Images.error
                .resizable()
                .frame(width: Constants.imageSize.width, height: Constants.imageSize.height)
                .foregroundColor(Colors.textTertiary)
            Text(viewModel.title)
                .font(.title2)
                .foregroundColor(Colors.textPrimary)
                .lineLimit(1)
            Text(viewModel.message)
                .font(.body)
                .foregroundColor(Colors.textSecondary)
                .padding([.top], Constants.smallSpacing)
                .multilineTextAlignment(.center)
            Button(viewModel.action, action: viewModel.onAction)
                .padding([.top], Constants.bigSpasing)
        }
    }
}
