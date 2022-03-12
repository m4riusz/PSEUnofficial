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
    private typealias Colors = Assets.Colors.iOS
    let viewModel: FlowRowViewModel

    var body: some View {
        HStack {
            viewModel.country.image
                .resizable()
                .frame(width: Constants.imageSize.width, height: Constants.imageSize.height)
            VStack(alignment: .leading) {
                HStack {
                    Text(viewModel.current)
                        .font(.callout)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Colors.textPrimary)
                    FlowView(viewModel: viewModel.currentViewModel)
                }
                HStack {
                    Text(viewModel.planned)
                        .font(.callout)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Colors.textPrimary)
                    FlowView(viewModel: viewModel.currentViewModel)
                }
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
