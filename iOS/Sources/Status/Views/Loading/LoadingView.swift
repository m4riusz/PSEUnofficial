//
//  LoadingView.swift
//  iOS
//
//  Created by Mariusz Sut on 13/03/2022.
//

import SwiftUI

struct LoadingView: View {
    let viewModel: LoadingViewModel

    var body: some View {
        ProgressView(viewModel.title)
    }
}
