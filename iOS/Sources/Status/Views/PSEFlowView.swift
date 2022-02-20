//
//  PSEFlowView.swift
//  iOS
//
//  Created by Mariusz Sut on 05/02/2022.
//

import SwiftUI
import Core

struct PSEFlowView: View {

    let flow: PSEFlow

    var body: some View {
        HStack {
            flow.direction.country
                .resizable()
                .frame(width: 40, height: 40)
            VStack {
                Text("Current: \(flow.value)").foregroundColor(Assets.Colors.Core.Buttons.primary)
                Text("Planned: \(flow.planned)")
            }
            VStack {
                Text("Status")
                Text("\(flow.value)")
            }
        }
    }
}

extension PSEDirection {
    var country: Image {
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
