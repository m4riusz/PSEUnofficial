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
            Text(flow.direction.country)
            VStack {
                Text("Current: \(flow.value)")
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
    var country: String {
        typealias Country = Assets.Strings.iOS.Country
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
