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
        switch self {
        case .sweden: return "SE"
        case .germany: return "DE"
        case .czech: return "CS"
        case .slovakia: return "SK"
        case .ukraine: return "UA"
        case .lithuania: return "LT"
        }
    }
}
