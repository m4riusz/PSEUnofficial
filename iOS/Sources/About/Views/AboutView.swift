//
//  AboutView.swift
//  iOS
//
//  Created by Mariusz Sut on 25/02/2022.
//

import SwiftUI
import Core

struct AboutView: View {
    private struct Constants {
        static let spacing: CGFloat = 8
    }
    let viewModel: AboutViewModel

    var body: some View {
        VStack {
            Text("")
                .frame(maxWidth: .infinity, minHeight: 1, maxHeight: 1)
            
            List {
                Text(viewModel.appName)
                    .font(.title)
                Text(viewModel.aboutDescription)
                    .font(.body)
                VStack(alignment: .leading, spacing: Constants.spacing) {
                    Text(viewModel.apiProviderTitle)
                        .font(.body)
                    LinkView(viewModel: viewModel.apiLink)
                }
                VStack(alignment: .leading, spacing: Constants.spacing) {
                    Text(viewModel.iconProviderTitle)
                        .font(.body)
                    LinkView(viewModel: viewModel.iconLink)
                }
                Text(viewModel.versionWithBuild).font(.caption)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .listRowSeparator(.hidden)
            }
            .foregroundColor(Assets.Colors.iOS.textPrimary)
            .listStyle(.plain)
        }
    }
}
