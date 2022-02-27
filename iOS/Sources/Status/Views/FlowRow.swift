//
//  FlowRow.swift
//  iOS
//
//  Created by Mariusz Sut on 05/02/2022.
//

import SwiftUI
import Core

struct FlowRow: View {
    private struct Constants {
        static let imageSize = CGSize(width: 40, height: 40)
    }
    let viewModel: FlowRowViewModel

    var body: some View {
        HStack {
            viewModel.country.image
                .resizable()
                .frame(width: Constants.imageSize.width, height: Constants.imageSize.height)
            VStack(alignment: .leading) {
                Flow(viewModel: viewModel.currentViewModel)
                Flow(viewModel: viewModel.plannedViewModel)
            }
        }
    }
}

extension PSEDirection {
    var image: Image {
        typealias Country = Assets.Images.iOS
        switch self {
        case .sweden: return Country.sweden
        case .germany: return Country.germany
        case .czech: return Country.czech
        case .slovakia: return Country.slovakia
        case .ukraine: return Country.ukraine
        case .lithuania: return Country.lithuania
        }
    }
}
