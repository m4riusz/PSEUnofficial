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
        static let headerIdentifier = "AboutRowHeaderIdentifier"
        static let descriptionIdentifier = "AboutRowDescriptionIdentifier"
        static let linkTitleIdentifier = "AboutRowLinkTitleIdentifier"
        static let linkIdentifier = "AboutRowLinkIdentifier"
        static let versionIdentifier = "AboutRowVersionIdentifier"
    }
    private typealias Colors = Assets.Colors.Core
    let viewModel: AboutRowViewModel

    var body: some View {
        switch viewModel {
        case .header(let text):
            Text(text)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(Colors.textPrimary)
                .accessibility(identifier: Constants.headerIdentifier)
        case .description(let text):
            Text(text)
                .font(.body)
                .foregroundColor(Colors.textPrimary)
                .accessibility(identifier: Constants.descriptionIdentifier)
        case .link(let title, let linkViewModel):
            VStack(alignment: .leading, spacing: Constants.spacing) {
                Text(title)
                    .font(.body)
                    .foregroundColor(Colors.textPrimary)
                    .accessibility(identifier: Constants.linkTitleIdentifier)
                LinkView(viewModel: linkViewModel)
                    .accessibility(identifier: Constants.linkIdentifier)
            }
            .foregroundColor(Colors.textPrimary)
        case .version(let version):
            Text(version)
                .font(.caption)
                .foregroundColor(Colors.textSecondary)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .accessibility(identifier: Constants.versionIdentifier)
        }
    }
}
