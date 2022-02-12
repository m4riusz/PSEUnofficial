//
//  PSEStatusView.swift
//  iOS
//
//  Created by Mariusz Sut on 05/02/2022.
//

import SwiftUI
import Core

struct PSEStatusView: View {

    let status: PSEStatus

    var body: some View {
        NavigationView {
            List {
                Section("Flows") {
                    ForEach(status.data.flows, id: \.direction) { flow in
                        PSEFlowView(flow: flow)
                    }
                }
                Section("Summary") {
                    PSESummaryView(summary: status.data.summary)
                }
                Text("\(status.date.ISO8601Format())")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.caption)

            }
        }
    }
}
