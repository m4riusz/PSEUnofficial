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
                ForEach(viewModel.items) { itemViewModel in
                    AboutRow(viewModel: itemViewModel)
                }
            }
            .listStyle(.plain)
        }
    }
}
