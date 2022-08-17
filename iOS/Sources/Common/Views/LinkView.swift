//
//  LinkView.swift
//  iOS
//
//  Created by Mariusz Sut on 23/03/2022.
//

import SwiftUI
import Core

struct LinkView: View {
    private typealias Colors = Assets.Colors.Core
    let viewModel: LinkViewModel

    var body: some View {
        Text(viewModel.text ?? viewModel.url.absoluteString)
            .font(.body)
            .foregroundColor(Colors.tint)
            .underline()
            .onTapGesture { viewModel.tap() }
    }
}
