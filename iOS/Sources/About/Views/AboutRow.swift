//
//  AboutRow.swift
//  iOS
//
//  Created by Mariusz Sut on 24/03/2022.
//

import Core
import SwiftUI

struct AboutRow: View {
    private struct Constants {
        static let spacing: CGFloat = 8
    }

    let viewModel: AboutRowViewModel

    var body: some View {
        switch viewModel {
        case .header(let text):
            Text(text)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(Assets.Colors.iOS.textPrimary)
        case .description(let text):
            Text(text)
                .font(.body)
                .foregroundColor(Assets.Colors.iOS.textPrimary)
        case .link(let title, let linkViewModel):
            VStack(alignment: .leading, spacing: Constants.spacing) {
                Text(title)
                    .font(.body)
                LinkView(viewModel: linkViewModel)
            }
            .foregroundColor(Assets.Colors.iOS.textPrimary)
        case .version(let version):
            Text(version).font(.caption)
                .foregroundColor(Assets.Colors.iOS.textSecondary)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
